class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_alert(object_with_error)
    flash.now.alert = object_with_error.errors.full_messages
  end
end
