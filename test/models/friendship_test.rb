# frozen_string_literal: true

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  setup do
    sign_in create(:user)
    create(:user)
  end

  test 'Users cannot befriend themselves' do
    friendship = Friendship.new(user_id: User.last.id, friend_id: User.last.id)
    assert_not friendship.valid?
  end

  test 'No duplicate frienships are allowed' do
    Friendship.create(user_id: User.first.id, friend_id: User.last.id)
    friendship = Friendship.new(user_id: User.first.id, friend_id: User.last.id)
    assert_not friendship.valid?
  end
end
