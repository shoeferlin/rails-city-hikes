class DublicatesController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    authorize @route
    @dup_route = @route.duplicate(current_user)
    redirect_to edit_route_path(@dup_route)
  end
end
