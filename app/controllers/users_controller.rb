class UsersController < ApplicationController
  before_action :set_user
  def index; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile successfully updated'
      redirect_to root_path
    else
      flash[:danger] = 'Something wrong...'
      redirect_to edit_user_path(@user)
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :remove_avatar)
  end
end
