class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :setup_default_params

  layout :layout_by_resource

  def setup_default_params
    @sidebar = ''
  end

  private
  def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'application'
    end
  end
end
