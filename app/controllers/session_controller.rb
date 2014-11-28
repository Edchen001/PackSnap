class SessionController < ApplicationController
  def new
    render :login
  end

  def login
    @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end