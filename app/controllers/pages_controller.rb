class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @number_of_routes = Route.count
    @cities = City.where.not(latitude: nil, longitude: nil)

    @landing_page_markers = @cities.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
