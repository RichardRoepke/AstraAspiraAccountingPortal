class Admin::ParksController < AdminController
  def index
    @content_header = 'All Parks'
    @sidebar = 'parks:index'
    @park_list = Park.order(:name)
  end

  def show
    @sidebar = 'show'
    @park = Park.find(params[:id])
    @content_header = @park.name + ' Information'
  end
end