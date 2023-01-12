class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_public_users_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
