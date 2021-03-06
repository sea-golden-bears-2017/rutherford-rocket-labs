class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:admin] == "1"
      @user.admin = true
    end

    if @user.save
      flash[:success] = "Successfully created user #{@user.first_name} #{@user.last_name}"
      redirect_to root_path
    else
      render "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end
