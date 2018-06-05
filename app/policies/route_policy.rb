class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
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
    true
  end

  def update?
    user?
  end

  def fetch_wikipedia_data?
    true
  end

  private

  def user?
    user == record.user || user.admin
  end
end
