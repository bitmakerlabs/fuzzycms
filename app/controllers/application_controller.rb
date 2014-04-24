class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Catch all CanCan error and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private
  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end
end
