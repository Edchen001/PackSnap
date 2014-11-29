class UsersController < ApplicationController
  def new
    @user = User.new
    render :signup, locals:{user: @user}
  end
  def show
    @user = User.find(session[:user_id])
  end
  def edit
    @user = User.find(session[:user_id])
    render :edit, locals:{user: @user}
  end
  def update
    @user = User.find(session[:user_id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      set_alert(@user)
      render :edit
    end
  end
  def create
    @user = User.new
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      set_alert(@user)
      render :signup
    end
  end
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirm)
  end
end