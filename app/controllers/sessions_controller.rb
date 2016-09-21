class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
  	@user = User.authenticate(params[:name], params[:password])
  	if @user.present?
  		session[:user_id] = @user.id
  		redirect_to admin_path
  	else
  		flash[:alert] = "Invalid User Name or Password"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:alert] = "Successfully logged out"
  	redirect_to login_path
  end
end
