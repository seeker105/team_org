class SessionsController < ApplicationController

  def create
    if user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = user.id
      redirect_to landing_page_path
    else
      flash[:danger] = "Login failed."
      redirect_to root_path
    end
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
