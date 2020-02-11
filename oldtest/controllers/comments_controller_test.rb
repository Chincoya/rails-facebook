# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    post posts_path(post: { content: 'Lol' }), headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
  end

  test 'signed out user cant comment post' do
    count = Comment.count
    sign_out :user
    post post_comments_path(comment: { content: 'lel', post_id: Post.last.id }),
         headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
    assert_equal(count, Comment.count)
  end

  test 'signed in user can comment post' do
    post post_comments_path(comment: { content: 'lel', post_id: Post.last.id }),
         headers: { 'HTTP_REFERER' => 'http://localhost:3000/' }
    assert_equal(1, Comment.count)
  end

  test 'Commenting should redirect to same page' do
    post post_comments_path(comment: { content: 'lel', post_id: Post.last.id }),
         headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    assert_redirected_to(root_url)
  end
end
