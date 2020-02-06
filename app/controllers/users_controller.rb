# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]
  def show
    @user = params[:format] ? User.find(params[:format]) : current_user
    @posts = @user.posts.order('created_at DESC')
    @post = Post.new
  end

  def index
    @users = User.all - [current_user]
    @user = current_user
  end
end
