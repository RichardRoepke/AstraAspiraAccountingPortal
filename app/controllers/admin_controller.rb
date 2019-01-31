class AdminController < ApplicationController
  # Inherited by the controllers in controllers/admin to handle user validation
  # and provide various common functions.

  before_filter :authenticate_admin

  layout 'admin'

  def authenticate_admin
    authenticate_user!
    unless current_user.admin?
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end
end