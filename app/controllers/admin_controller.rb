class AdminController < ApplicationController
  # Inherited by the controllers in controllers/admin to handle user validation
  # and provide various common functions.

  before_filter :authenticate_admin

  layout 'admin'
end