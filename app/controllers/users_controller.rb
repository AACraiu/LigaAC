class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_user
    redirect_to login_path unless logged_in?
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
