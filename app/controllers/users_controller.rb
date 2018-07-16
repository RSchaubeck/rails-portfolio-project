class UsersController < ApplicationController

  def index
    if session[:user_id]
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    else
      render :index
    end
  end

  def new
  end

  def create
    flash[:notice] = "Make sure passwords match and/or email is correct."
    @user = User.new(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
