class Admin::NgoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.is_stakeholder?(user)
  end
end
