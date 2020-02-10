# frozen_string_literal: true

class Friendship < ApplicationRecord
  validate :duplicate
  validate :self_friend
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  scope :confirmed, -> { where(confirm: true) }
  scope :unconfirmed, -> { where(confirm: nil) }

  def sent_name
    User.find(friend_id).name
  end

  private

  def self_friend
    return unless user_id == friend_id

    errors.add(:base, "Can't befriend yourself")
  end

  def duplicate
    return unless User.find(user_id).friendships.find_by(friend_id: friend_id)

    errors.add(:base, 'No duplicate values')
  end
end
