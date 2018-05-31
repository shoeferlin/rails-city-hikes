class DashboardsController < ApplicationController
  def index
    @routes = policy_scope(Route)

  end

  def show
  end
end
