module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    user.remember_user
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    puts "logged in "
  end

  def current_user
    if (user_id = session[:user_id]) #if current user already exists
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) #check in cookies if exists
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user=(user)
  end

  def logged_in?
    !current_user.nil? #calls function
  end

  def sign_out
    @current_user.update_attribute(:remember_digest, nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
  end
end
