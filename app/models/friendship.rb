class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  scope :confirmed, -> { where(confirmed: true) } 
  scope :unconfirmed, -> { where(confirmed: false) } 
end
