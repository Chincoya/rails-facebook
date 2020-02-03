# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments

  def like_count
    likes.count
  end

  def liked_by(current_user)
    current_user.likes.find_by(likeable_id: id)
  end
end
