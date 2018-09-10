class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Hi"
    else
      redirect_to login_path
    end
  end

  def createbyfacebook
    @user = User.find_or_create_by(id: auth['id']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
