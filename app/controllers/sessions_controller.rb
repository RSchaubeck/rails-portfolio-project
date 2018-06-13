class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.first_name = get_name(auth['info']['name'])[0]
        u.last_name = get_name(auth['info']['name'])[1]
        u.email = auth['info']['email'].downcase
      end
    else
      @user = User.find_by(email: params[:user][:email])
      @user = @user.try(:authenticate, params[:user][:password])
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def get_name(name)
    name.split(" ") unless !name.include?(" ")
  end

end
