class ApplicationController < ActionController::Base
  include SessionsHelper

  def hello_world
    if logged_in?
      redirect_to users_path
    else
      redirect_to login_path
    end
  end
end
