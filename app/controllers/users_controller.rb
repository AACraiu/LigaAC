class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def check_user
    if !logged_in?
      redirect_to login_path
    end
  end
end
