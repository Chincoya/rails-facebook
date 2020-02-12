require 'rails_helper'

RSpec.describe Friendship, type: :model do
  setup do
    create(:user)
    create(:user)
  end
  it "cannot befriend self" do
    friendship = Friendship.new(user_id: User.last.id, friend_id: User.last.id)
    expect(friendship.valid?).to be_falsy
  end
  it "cannot be duplicated" do
    Friendship.create(user_id: User.first.id, friend_id: User.last.id)
    dup = Friendship.new(user_id: User.first.id, friend_id: User.last.id)
    expect(dup.valid?).to be_falsy
  end
end
