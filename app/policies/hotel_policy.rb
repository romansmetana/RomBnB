class HotelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.owner?
        scope.where(user_id: @user.id)
      else
        scope.all
      end
    end
  end

  def create?
    @user.owner?
  end

  def update?
    @user.owner?
  end

  def destroy?
    @user.owner?
  end

  def add_images?
    @user.owner?
  end

  def destroy_img?
    @user.owner?
  end

  def set_main_image?
    @user.owner?
  end
end
