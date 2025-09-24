class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user

  private

  def current_user
    # Jos session[:user_id] on olemassa, hae User
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
