# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    post posts_path(post: { content: 'Lol' }), headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
  end

  test 'signed out user cant like post' do
    count = Like.count
    sign_out :user
    post likes_path(post: { post_id: Post.last.id }), headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
    assert_equal(count, Like.count)
  end

  test 'signed in user can like post' do
    post likes_path(post: { post_id: Post.last.id }), headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
    assert_equal(1, Like.count)
  end

  test 'Like should redirect to same page' do
    post likes_path(post: { post_id: Post.last.id }), headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    assert_redirected_to(root_url)
  end
end
