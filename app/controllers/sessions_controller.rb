class SessionsController < ApplicationController

  include UsersHelper

  def new
  end

  def create
    flash[:notice] = 'Email or password is incorrect.'
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.first_name = get_first_name(auth['info']['name'])
        u.last_name = get_last_name(auth['info']['name'])
        u.email = auth['info']['email'].downcase
      end
    else
      @user = User.find_by(email: params[:user][:email])
      @user = @user.try(:authenticate, params[:user][:password])
      return redirect_to login_path unless @user
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def get_name(name)
    name.split(" ") unless !name.include?(" ")
  end

end
