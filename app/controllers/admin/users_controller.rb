class Admin::UsersController < AdminController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :extra_actions]

  def index
    @sidebar = 'users:index'
    @content_header = 'All Users'
    @user_list = User.all
  end

  def show
    @sidebar = 'users:info'
    @content_header = @user.email  + ' Information'
  rescue
    flash[:error] = 'Could not find user.'
    redirect_to admin_users_path
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
        flash[:success] = user.email + ' was successfully created.'
        redirect_to admin_user_path(user)
      else
        flash[:error] = 'The information was valid but the user could not be created.'
        redirect_to :back
      end
    else
      flash[:error] = user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @sidebar = 'users:edit'
    @content_header = 'Edit ' + @user.email
  end

  def update
    result = { status: 'failure',
               message: 'An exception has occurred. Please try again.' }

    if @user.present? && @user.update(user_params)
      # Otherwise the server would automatically log the user out to sign back in.
      bypass_sign_in(@user) if @user.id == current_user.id
      result[:status] = 'Success'
      result[:message] = @user.email + ' has been successfully updated.'
    elsif @user.present?
      result[:message] = @user.email + ' could not be updated.'
    else
      result[:message] = 'User could not be found.'
    end

    render json: result
  end

  def destroy
    username = 'User'
    username = @user.email if @user.present?

    if @user.id != current_user.id && @user.destroy
      flash[:success] = username + ' was successfully deleted.'
    elsif @user.id == current_user.id
      flash[:warning] = 'Cannot delete own user account. Please contact another administrator if needed.'
    else
      flash[:error] = username + ' could not be deleted.'
    end

    redirect_to admin_users_path
  end

  def extra_actions
    username = 'User'
    username = @user.email if @user.present?

    begin
      if params[:commit].include?('Reconfirm')
        @user.resend_confirmation_instructions
        flash[:success] = username + ' has been sent a new confirmation email.'
      elsif params[:commit].include?('Reset Password')
        @user.send_reset_password_instructions
        flash[:success] = username + ' has been sent reset password instructions.'
      else
        flash[:error] = 'No action found for ' + username + '.'
      end
    rescue => exception
      if params[:commit].present?
        flash[:error] = 'Could not complete ' + params[:commit] + ' for ' + username + '.'
      else
        flash[:error] = 'Not user action found.'
      end
    end

    redirect_to admin_user_path(@user) and return if @user.present?
    redirect_to admin_users_path
  end

  def find_user
    @user = User.find(params[:id] || params[:user_id] || params[:user][:id])
  rescue
    flash[:error] = "Couldn't find desired user."
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end