# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  before_action :authenticate_user!
  before_action :set_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :danger, :info, :warning, :success

  protected

  def set_user
    @user = current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :owner)
    end
  end
end
