# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_array = friendships.confirmed.map(&:friend)
    friends_array.compact
  end

  def friendship?(user)
    friendly = friendships.find_by(friend_id: user.id)
    friendly
  end

  def friends_posts
    all_posts = []
    all_posts = posts.map { |post| post }
    friends.each do |friend|
      all_posts << friend.posts.map { |post| post }
    end
    all_posts.flatten.each { |i| p i }

    all_posts.flatten.sort { |elem1, elem2| elem2.created_at - elem1.created_at }
  end
end
