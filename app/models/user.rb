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
    friends_array = friendships.confirmed.map{ |friendship| friendship.friend }
    friends_array += inverse_friendships.confirmed.map{ |friendship| friendship.friend }
    friends_array.compact
  end

  def has_friendship(user)
    friendly = friendships.find_by(friend_id: user.id)
    friendly ||= inverse_friendships.find_by(user_id: user.id)
    friendly
  end
end
