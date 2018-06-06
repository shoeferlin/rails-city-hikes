class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.active.or(scope.owned_by(user))
      # scope.where(public: true).or(scope.where(public: false, user: user))
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    true
  end

  def fetch_wikipedia_data?
    true
  end

  private

  def user?
    user == record.user || user.admin
  end
end
