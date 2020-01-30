require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  #
  setup do
    sign_in create(:user)
  end

  test 'signed in user can get to create post' do
    get new_post_path
    assert_response :success    
  end

  test 'signed in user can get to post index' do
    get posts_path
    assert_response :success    
  end

  test 'new_post_path redirects non signed in users' do
    sign_out :user
    get new_post_path
    assert_response :redirect
  end

  test 'signed users can create posts' do
    post posts_path(post: {content: 'Lol'})
    assert_equal(1, Post.count)
  end

  test 'unsigned users cant create posts' do
    count = Post.count
    sign_out :user
    post posts_path(build(:post, user_id: build(:user).id))
    assert_equal(count, Post.count)
  end

end
