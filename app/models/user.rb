# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
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

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
    end
  end
end
