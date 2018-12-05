class ApplicationController < ActionController::Base
before_action :require_login, :except => [:new, :create]
skip_before_action :require_login, only: [:new, :create]
private

def require_login
  unless current_user
    flash.now.alert = 'You must be logged in to view this site'
    render ('sessions/new.html.erb')
  end
  #redirect_to login_url, notice: "Not authorized" if current_user.nil?
end

def authorize_admin
  redirect_to root_path, alert: 'You must be admin to view another user profile.' unless current_user.admin? || (edit_user_path == edit_user_path(current_user)||edit_user_post_path == edit_user_post_path(current_user))
  #redirect_to root_path unless current_user.admin?
  #redirects to previous page
end

def current_user
  begin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    session[:user_id] = nil
  end
end

helper_method :current_user

end
