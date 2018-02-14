class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
    @post = Post.new(author: current_user.name, comment: params[:session][:comment], user_id: current_user.id)
    @post.save
    flash[:notice] = @post.errors.full_messages if flash
    redirect_to root_url
  end

  def index
    @posts = Post.all
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:info] = "Please login to create a new post"
        redirect_to login_path
      end
    end
end
