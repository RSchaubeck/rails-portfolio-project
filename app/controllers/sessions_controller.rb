class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless @user
    session[:user_id] = @user.id
    redirect_to "/"
  end


end
