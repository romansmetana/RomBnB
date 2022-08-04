class ReviewPolicy < ApplicationPolicy
    def create?
      !@user.owner?
    end
  end
  