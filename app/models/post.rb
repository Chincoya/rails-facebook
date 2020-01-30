# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes, as: :likeable
end
