class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to my_page_public_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
