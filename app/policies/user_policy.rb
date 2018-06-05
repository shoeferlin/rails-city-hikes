class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def show?
    true
  end

  def edit?
    update?
  end


  def update?
    # current_user == @user
    user == record
  end
end
