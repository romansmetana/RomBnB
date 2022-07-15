class ResrvationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.owner?
        scope.where(room_id: @user.hotels.map { |h| h.rooms.pluck(:id) }.flatten)
      else
        scope.where(user_id: @user.id)
      end
    end
  end

  def create?
    !@user.owner?
  end

  def destroy?
    @user.owner? || !@user.owner?
  end
end
