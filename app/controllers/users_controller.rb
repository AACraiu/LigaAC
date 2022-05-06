class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
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
end
