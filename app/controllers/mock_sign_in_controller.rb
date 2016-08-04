class MockSignInController < ApplicationController
  def create
    auth_object = OpenStruct.new(params[:auth_hash])
    user = User.find_or_create_from_auth_hash(auth_object)
    session[:user_id] = user.id
    redirect_to coach_dashboard_path
  end

end
