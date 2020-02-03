# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show index]
  def show
    @user = current_user
    @posts = current_user.posts.order('created_at DESC')
    @post = Post.new
  end

  def index
    @users = User.all
  end
end
