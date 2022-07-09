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

  def new?
    create?
  end

  def update?
    @user.owner?
  end

  def edit?
    update?
  end
end
