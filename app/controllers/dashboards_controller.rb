class DashboardsController < ApplicationController
  def index
    @user = current_user
    @routes = policy_scope(Route).all
    @hiked_routes = HikedRoute.where(user_id: @user.id)
  end

  def show
  end
end
