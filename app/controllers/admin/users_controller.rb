class Admin::UsersController < AdminController
  def index
    @sidebar = 'users:index'
    @content_header = 'All Users'
    @user_list = User.all
  end

  def show
    @sidebar = 'users:info'
    @user = User.find(params[:id])
    @content_header = @user.email  + ' Information'
  end
end