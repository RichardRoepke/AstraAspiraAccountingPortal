class Admin::ParksController < AdminController
  before_action :find_park, only: [:show, :edit, :update]

  def index
    @content_header = 'All Parks'
    @sidebar = 'parks:index'
    @park_list = Park.order(:name)
  end

  def show
    @sidebar = 'parks:show'
    @content_header = @park.name + ' Information'
  end

  def edit
    @sidebar = 'parks:edit'
    @content_header = 'Edit ' + @park.name
  end

  def update
    result = { status: 'failure',
               message: 'An exception has occurred. Please try again.' }

    if @park.present? && @park.update(park_edit_params)
      result[:status] = 'Success'
      result[:message] = @park.name + ' has been successfully updated.'
    elsif @park.present?
      result[:message] = @park.name + ' could not be updated.'
    else
      result[:message] = 'Park could not be found.'
    end

    render json: result
  end

  def find_park
    @park = Park.find(params[:id] || params[:park][:id])
  end

  def park_edit_params
    params.require(:payment).permit(:first_name, :last_name, :address1, :address2, :city, :province, :postal)
  end
end