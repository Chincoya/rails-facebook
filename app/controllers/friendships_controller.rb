class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    friendship_id = friend_params[:user_id]
    current_user.friendships.create(friend_id: friendship_id)
    redirect_to request.referer
  end

  def destroy
    par_id = params[:id]
    Like.delete(par_id) if correct_user(Like.find(par_id).user_id)
    redirect_to request.referer
  end

  private

  def correct_user(id)
    current_user.id == id
  end

  def friend_params
    params.require(:post).permit(:post_id)
  end
end
