# frozen_string_literal: true

require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    create(:user)
  end

  test 'unsigned users can\'t make friends' do
    sign_out :user
    post friendships_path(params: { user: { user_id: User.last.id } })
    assert_response :redirect
  end

  test 'signed users can send friendship invitations' do
    post friendships_path(params: { user: { user_id: User.last.id } }),
         headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    assert_nil Friendship.first.confirm
    assert_equal(Friendship.first.user_id, User.last.id)
  end

  test 'user cant confirm invites sent by her' do
    post friendships_path(params: { user: { user_id: User.last.id } }),
         headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    patch friendship_path(Friendship.last.id),
          headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    assert_nil Friendship.first.confirm
  end

  test 'user can confirm frienship inviest sent to her' do
    post friendships_path(params: { user: { user_id: User.last.id } }),
         headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    sign_out :user
    sign_in User.last
    patch friendship_path(Friendship.last.id),
          headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    assert_equal(Friendship.last.confirm, true)
  end
end
