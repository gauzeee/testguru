class SessionsController < ApplicationController

  before_action :authenticate_user!, only: :destroy
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || root_path
      cookies.delete(:path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Name and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
