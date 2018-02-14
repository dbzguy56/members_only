class SessionsController < ApplicationController

  def new
  end

  def create #submit a post request
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) #if correct password and user sign them in
      log_in user
      @current_user = current_user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out if logged_in?
    redirect_to root_url
  end
end
