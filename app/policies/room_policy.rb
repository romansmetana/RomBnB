class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end
  
  def create?
    @user.owner?
  end

  def edit?
    update?
  end

  def update?
    @user.owner?
  end
end
