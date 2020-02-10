# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user
    friendship_id = friend_params[:user_id]
    new_friend = Friendship.new(user_id: friendship_id, friend_id: @user.id)
    if new_friend.save
      @user.friendships.create(friend_id: friendship_id, confirm: true)
      flash[:sucess] = 'Friend Added'
    else
      flash[:danger] = 'Error adding friend'
    end
    redirect_to request.referer
  end

  def destroy
    friendship_id = params[:id]
    friendship = Friendship.find(friendship_id)
    inverse = Friendship.where('user_id = ? and friend_id = ?', friendship.friend_id, friendship.user_id)
    Friendship.delete(friendship_id)
    Friendship.delete(inverse[0].id)
    redirect_to request.referer
  end

  def update
    friendship_id = params[:id]
    friendship = Friendship.find(friendship_id)
    inverse = Friendship.where('user_id = ? and friend_id = ?', friendship.friend_id, friendship.user_id)
    if friendship.user_id == current_user.id
      friendship.confirm = true
      inverse[0].confirm = true
      friendship.save(validate: false)
      inverse[0].save(valdiate: false)
      flash[:sucess] = 'Frienship Confirmed'
    end
    redirect_to request.referer
  end

  private

  def friend_params
    params.require(:user).permit(:user_id)
  end
end
