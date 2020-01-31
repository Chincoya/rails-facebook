# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    post_id = like_params[:post_id]
    current_user.likes.create(likeable: Post.find(post_id)) unless current_user.likes.find_by(likeable_id: post_id)
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

  def like_params
    params.require(:post).permit(:post_id)
  end
end
