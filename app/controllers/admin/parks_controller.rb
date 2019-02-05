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
    @new_park = Park.new()
  end

  def create
    park = Park.create(park_params)

    if park.valid?
      if park.save!
        flash[:success] = park.name + ' was successfully created.'
        redirect_to admin_parks_path
      else
        flash[:error] = 'The park could not be saved. Please try again in a few moments.'
        redirect_to :back
      end
    else
      flash[:error] = park.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @sidebar = 'parks:edit'
    @content_header = 'Edit ' + @park.name
  end

  def update
    result = { status: 'failure',
               message: 'An exception has occurred. Please try again.' }

    if @park.present? && @park.update(park_params)
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

  def park_params
    params.require(:park).permit(:username, :name, :address, :city, :zipcode, :phone, :email, :report, :state_id)
  end
end