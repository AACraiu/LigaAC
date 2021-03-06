class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    if @user.present?
      @posts = @user.posts.paginate(page: params[:page], per_page: 5)
      @post = Post.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/users'
  end
  
  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
