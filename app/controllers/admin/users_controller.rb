class Admin::UsersController < AdminController
  def index
    @content_header = 'All Users'
    @sidebar = 'users:index'
    @user_list = User.all
  end

  def edit
    @sidebar = 'users:edit'
    @user = User.find(params[:id])
    @content_header = 'Edit ' + @user.name
  end

  def show
    @user = User.find(params[:id])
    @content_header = @user.username  + ' Information'
    @sidebar = 'users:info'
    @payment = @user.payments.last
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :address, :phone, :email, :active, :logo, :sync))
      flash[:success] = "User updated."
      redirect_to :back
    else
      redirect_to edit_admin_user_path(@park)
    end
  end
end