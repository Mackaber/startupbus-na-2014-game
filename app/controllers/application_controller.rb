class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    current_omniauthable
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
