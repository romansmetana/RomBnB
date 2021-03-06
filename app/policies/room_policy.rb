class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
end
