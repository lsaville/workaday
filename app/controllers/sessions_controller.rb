class SessionsController < ApplicationController
  skip_before_action :authorize_user

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      flash[:success] = "You Successfully Logged In!"
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You Successfully Logged Out!"
    redirect_to login_path
  end
end
