class ExportPolicy < ApplicationPolicy
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

  def send_route_email?
    true
  end

  def send_route_phone?
    true
  end

  def send_route_clipboard?
    true
  end

  def send_route_gmaps?
    true
  end

  def send_route_friend?
    true
  end
end
