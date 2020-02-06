# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    friendship_id = friend_params[:user_id]
    current_user.friendships.create(friend_id: friendship_id)
    redirect_to request.referer
  end

  def destroy
    friendship_id = params[:id]
    Friendship.delete(friendship_id)
    redirect_to request.referer
  end

  def update
    friendship_id = params[:id]
    friendship = Friendship.find(friendship_id)
    friendship.confirm = true if friendship.friend_id == current_user.id
    friendship.save
    redirect_to request.referer
  end

  private

  def friend_params
    params.require(:user).permit(:user_id)
  end
end
