class ApplicationController < ActionController::Base
  # all actions need authorization except for those specified.
  before_action :authorize
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please log in'
      end
    end
end
