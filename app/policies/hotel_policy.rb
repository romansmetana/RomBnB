class HotelPolicy < ApplicationPolicy
  class Scope < Scope   
    def resolve
      if @user.owner?
        scope.where(user_id: @user.id)
      else
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
      udpdate?
    end
    
    def update?
      @user.owner?
    end
    
  end
end
