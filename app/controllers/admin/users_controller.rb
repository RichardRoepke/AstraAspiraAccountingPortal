class Admin::UsersController < AdminController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @sidebar = 'users:index'
    @content_header = 'All Users'
    @user_list = User.all
  end

  def show
    @sidebar = 'users:info'
    @content_header = @user.email  + ' Information'
  end

  def new
    @sidebar = 'users:new'
    @content_header = 'Add New User'
    @new_user = User.new
  end

  def create
    user = User.create(user_params)

    if user.valid?
      if user.save!
        flash[:success] = user.name + ' was successfully created.'
        redirect_to admin_user_path(user)
      else
        flash[:error] = 'The park could not be saved. Please try again in a few moments.'
        redirect_to :back
      end
    else
      flash[:error] = user.errors.full_messages
      redirect_to :back
    end
  end

  #def edit
  #  @sidebar = 'users:edit'
  #  @content_header = 'Edit ' + @user.name
  #end

  #def update
  #  result = { status: 'failure',
  #             message: 'An exception has occurred. Please try again.' }
  #
  #  if @user.present? && @user.update(user_params)
  #    result[:status] = 'Success'
  #    result[:message] = @user.name + ' has been successfully updated.'
  #  elsif @user.present?
  #    result[:message] = @user.name + ' could not be updated.'
  #  else
  #    result[:message] = 'User could not be found.'
  #  end
  #
  #  render json: result
  #end

  def find_user
    @user = User.find(params[:id] || params[:user][:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :address, :city, :zipcode, :phone, :email, :report, :state_id)
  end
end