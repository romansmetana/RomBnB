class UsersController < ApplicationController
  before_action :set_user
  before_action :user_params, only: [:update]
  def index; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile successfully updated'
      redirect_to root_path
    else
      flash[:danger] = 'Something wrong...'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
