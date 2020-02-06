# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  scope :confirmed, -> { where(confirm: true) }
  scope :unconfirmed, -> { where(confirm: nil) }

  def sent_name
    User.find(user_id).name
  end
end
