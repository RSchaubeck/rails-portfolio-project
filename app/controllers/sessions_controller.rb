class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


end
