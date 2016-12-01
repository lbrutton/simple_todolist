class SessionsController < ApplicationController
	
	skip_before_action :ensure_login, only:[:new, :create]

  def new
  end

  def create
  	@user = User.where(username: params[:user][:username]).first
  	if @user && @user.authenticate(params[:user][:password])
  		session[:user_id] = @user.id
  		flash[:notice] = "Logged in successfully"
  		redirect_to root_path
  	else
  		flash[:alert] = "You fucked up"
  		redirect_to login_path
  	end

  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "Logged out successfully"
  	redirect_to login_path
  end
end
