# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    if current_user.comments.create(comment_params)
      redirect_to root_url
    else
      flash.now[:danger] = 'Error 500'
    end
  end

  def destroy
    par_id = params[:id]
    Comment.delete(par_id) if correct_user(Comment.find(par_id).user_id)
    redirect_to posts_path
  end

  private

  def correct_user(id)
    current_user.id == id
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
