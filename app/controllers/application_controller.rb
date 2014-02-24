class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    current_omniauthable
  end

  def access_denied
    render text: "HELLO"
  end

  def authenticate_omniauthable!
    raise "SHIT"
  end
end
