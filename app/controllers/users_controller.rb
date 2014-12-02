class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new
    @user.assign_attributes(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirm)
  end
end