class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
=begin
   
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,                            :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
    rescue_from ActionController::RoutingError,       :with => :render_not_found
    rescue_from ActionController::UnknownController,  :with => :render_not_found
    rescue_from ActionController::UnknownAction,      :with => :render_not_found
  end



  private
  def render_not_found(exception)
     render :template => "/error/404.html.erb", :status => 404
  end

  def render_error(exception)
    render :template => "/error/500.html.erb", :status => 500 
  end
=end
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
    new_user_session_path
  end
end
