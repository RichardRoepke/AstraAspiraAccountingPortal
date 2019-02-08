class Admin::ParksController < AdminController
  before_action :find_park, only: [:show, :edit, :update, :destroy]

  def index
    @content_header = 'All Parks'
    @sidebar = 'parks:index'
    @park_list = Park.with_deleted.order(:name)
  end

  def show
    @sidebar = 'parks:info'
    @content_header = @park.name + ' Information'
  end

  def new
    @sidebar = 'parks:new'
    @content_header = 'Add New Park'
    @new_park = Park.new
  end

  def create
    park = Park.create(park_params)

    if park.valid?
      if park.save!
        flash[:success] = park.name + ' was successfully created.'
        redirect_to admin_park_path(park)
      else
        flash[:error] = 'The information was valid but the park could not be created.'
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

  def destroy
    park_name = 'Park'
    park_name = @park.name if @park.present?

    if @park.destroy
      flash[:success] = park_name + ' was successfully deleted.'
    else
      flash[:warning] = park_name + ' could not be deleted.'
    end

    redirect_to admin_parks_path
  end

  def recover
    park_name = 'Park'
    park_name = @park.name if @park.present?

    if @park.recover
      flash[:success] = park_name + ' was successfully recovered.'
    else
      flash[:warning] = park_name + ' could not be recovered.'
    end

    redirect_to admin_parks_path
  end

  def find_park
    @park = Park.with_deleted.find(params[:id] || params[:park][:id])
  end

  def park_params
    params.require(:park).permit(:username, :name, :address, :city, :zipcode, :phone, :email, :report, :state_id)
  end
end