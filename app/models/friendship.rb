# frozen_string_literal: true

class Friendship < ApplicationRecord
  validate :duplicate
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  scope :confirmed, -> { where(confirm: true) }
  scope :unconfirmed, -> { where(confirm: nil) }

  def sent_name
    User.find(friend_id).name
  end

  private

  def duplicate
    return unless User.find(user_id).friendships.find_by(friend_id: friend_id)

    errors.add(:base, 'No duplicate values')
  end
end
