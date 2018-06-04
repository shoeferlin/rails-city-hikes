class WaypointsController < ApplicationController
before_action :set_waypoint, only: [:edit]

  def create
    @waypont = Waypoint.find(@sight.waypoints.last.id)
    # @waypoint = Waypoint.new(params_waypoint)
    @route = Route.find(params[:route_id])
    @sight = Sight.find(params[:sight_id])


    @waypoint.list_nr = @sight.list_nr
    @waypoint.save
    redirect_to edit_route_path(@route)
    raise
    authorize @waypoint
    if @waypoint.save
      @route.waypoints << @waypoint
      @sight.waypoint << @waypoint
      redirect_to edit_route_path(@route)
    else
      puts "Waypoint not saved"
      redirect_to edit_route_path(@route)
    end
  end

  def sort_waypoints
    logger.debug "Hello"
    logger.debug params
  end

  private

  def params_waypoint
    params.require(:waypoint).permit(:list_nr)
  end
end
