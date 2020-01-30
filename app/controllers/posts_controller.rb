class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.posts.create(post_params)
      redirect_to posts_path
    else
      flash.now[:danger] = "Error"
      render 'new'
    end
  end

  def destroy
  end


  private

    def post_params
      params.require(:post).permit(:content)
    end
end
