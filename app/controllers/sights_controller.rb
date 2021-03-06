class SightsController < ApplicationController
  def create
    @sight = Sight.new(params_sight)
    @route = Route.find(params[:route_id])
    # @waypoint = Waypoint.find(@route.waypoints.last.id)
    # @waypoint = Waypoint.find(params[:waypoint_id])
    authorize @sight
    if @sight.save
      @route.sights << @sight
      @route.save
      redirect_to edit_route_path(@route)
    else
      puts "Sorry not saved"
      redirect_to edit_route_path(@route)
    end
  end

  def destroy
    @route = Route.find(params[:route_id])
    @sight = Sight.find(params[:id])
    authorize @sight
    @sight.destroy
    redirect_to edit_route_path(@route)
  end

  private

  def params_sight
    params.require(:sight).permit(:name, :place_id, :url, :list_nr, :website, :formatted_address)
  end
end
