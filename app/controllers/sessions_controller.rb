class SessionsController < ApplicationController
  skip_before_action :authorize_user

  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
end
