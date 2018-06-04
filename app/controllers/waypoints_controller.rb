class WaypointsController < ApplicationController
before_action :set_waypoint, only: [:edit]

  def update
    p params
    puts "We are in UPDATE"
    puts "Getting waypoint"
    @waypoint = Waypoint.find(params[:id])
    puts "set new waypoint list_nr"
    @waypoint.set_list_position(params[:list_nr])
    # puts "findin route .. "
    # @route = Route.find(id: @waypoint.route_id)
    authorize @waypoint
    position = 0
    @waypoints = @waypoint.route.sights.map do |sight|
      position += 1
      { lat: sight.latitude,
        lng: sight.longitude,
        # label: "#{position.to_s}",
        label: { text: "#{position.to_s}", color: 'white'} ,
        # icon: {
        #   url: "images/markers/marker.png",
        #   scaledSize: new google.maps.Size(64, 64)
        # }
        # '#8aae92'
        # infoWindow: { content: render_to_string(partial: "/locations/map_box_two", locals: { location: location }) }
        # icon: image_tag("#{sight.picture_url}")
        # icon: "../images/map_pin.svg"
      }
    end
    render json: @waypoints
  end

  private

  # def params_waypoint
  #   params.require(:waypoint).permit(:list_nr)
  # end
end
