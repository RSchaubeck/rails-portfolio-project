class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end

end
