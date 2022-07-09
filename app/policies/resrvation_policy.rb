class ResrvationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.owner?
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end
  end

  def create?
    @user.owner? == false
  end
end
