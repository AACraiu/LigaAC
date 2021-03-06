module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    if session[:user_id].present?
      User.find_by(id: session[:user_id])
    end
  end
  
  # return true if the given user is the current user
  def current_user?(user)
    current_user == user
  end
  
  def logged_in?
    current_user.present?
  end
end
