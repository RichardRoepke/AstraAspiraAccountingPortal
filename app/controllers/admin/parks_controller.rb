class Admin::ParksController < AdminController
  before_action :find_park, only: [:show, :edit, :update]

  def index
    @content_header = 'All Parks'
    @sidebar = 'parks:index'
    @park_list = Park.order(:name)
  end

  def show
    @sidebar = 'parks:info'
    @content_header = @park.name + ' Information'
  end

  def new
    @sidebar = 'parks:new'
    @content_header = 'Add New Park'
    @park = Park.new
  end

  def edit
    @sidebar = 'parks:edit'
    @content_header = 'Edit ' + @park.name
  end

  def update
    result = { status: 'failure',
               message: 'An exception has occurred. Please try again.' }

    if @park.present? && @park.update(park_update_params)
      result[:status] = 'Success'
      result[:message] = @park.name + ' has been successfully updated.'
    elsif @park.present?
      result[:message] = @park.name + ' could not be updated.'
    else
      park = Park.new(park_update_params)

      if park.save!
        result[:status] = 'Success'
        result[:message] = 'Park was successfully created.'
      else
        result[:message] = 'Park could not be created.'
      end
    end

    render json: result
  end

  def find_park
    @park = Park.find(params[:id] || params[:park][:id])
  end

  def park_update_params
    params.require(:park).permit(:name, :address, :city, :zipcode, :phone, :email, :report)
  end
end