class SessionController < ApplicationController
  def new
    render :login
  end

  def login
    # Wait a minute here...this scares me.  This implies you're swallowing
    # errors when things are nil.  That seems risky, shouldn't we blow up when
    # authenticate fails
    #
    # Yeah, this is pretty risky.  According to:
    #
    # http://apidock.com/rails/Object/try
    #
    # If try fails we return nil.  That would be it's possible for @user.nil?
    # => true
    #
    # If that's the case, @user.id will fail for calling .id on nil.  This is a
    # dangerous thing I think.
    @user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirm)
  end
end
