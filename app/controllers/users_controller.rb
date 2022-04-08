class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end

    def show
        @user = User.where(id: params[:id]).first
    end
end
