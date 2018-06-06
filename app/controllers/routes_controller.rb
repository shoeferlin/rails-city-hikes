class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :fetch_wikipedia_data]
  protect_from_forgery except: :fetch_wikipedia_data

  def index
    @route_pictures = RoutePicture.all
    @cities = City.all
    # City
    if params["query"].nil?
      @city = ""
    else
      @city = params["query"].capitalize
    end
    # @routes = t: :asc)
    if City.where(locality: @city).exists?
      @routes =  policy_scope(Route).order(created_at: :asc).where(city_id: City.where(locality: @city).ids)
    else
      @city = "We don't know about this city yet"
      @routes = policy_scope(Route).order(created_at: :asc)
    end
    # Time
    # @routes = Route.all
  end

  def show
    position = 0
    @route_pictures = @route.route_pictures.all
    # @waypoints = Waypoint.new
    @new_review = Review.new
    @reviews = Review.where(route: @route)
    authorize @route
    @waypoints = @route.sights.map do |sight|
      position += 1
      { lat: sight.latitude,
        lng: sight.longitude,
        label: { text: "#{position.to_s}", color: 'white'},
      }
    end
  end

  def new
    @route = Route.new
    @cities = City.all
    authorize @route
    @route_pictures = @route.route_pictures.build
  end

  def create
    @route = Route.new(params_route)
    @route.city = City.find(params_city[:city])
    @route.user = current_user
    @route.public = true
    authorize @route
    if @route.save
      unless params['route_pictures'].nil?
        params[:route_pictures]['route_pictures'].each do |a|
          @route_pictures = @route.route_pictures.create!(route_picture: a, route_id: @route.id)
        end
      end
      redirect_to edit_route_path(@route)
    else
      @cities = City.all
      @route_pictures = @route.route_pictures.build
      render :new #'views/routes/new.html.erb'
      # redirect_to new_route_path(@route)
    end
  end

  def edit
    @sight = Sight.new
    @waypoint = Waypoint.new
    position = 0
    @waypoints = @route.sights.map do |sight|
      position += 1
      { lat: sight.latitude,
        lng: sight.longitude,
        label: { text: "#{position.to_s}", color: 'white'},
        # infoWindow: { content: render_to_string(partial: "#{sight.description}", locals: { location: location })},
        # fillColor: '#8aae92'
        # icon: image_tag("marker.svg"),
      }
    end
  end

  def save_time_and_date

  end

  def update
    p params
    @route = Route.find(params[:id])
    @route.time = params[:time]
    @route.distance = params[:distance]
    authorize @route
    if @route.save
      # render json: @waypoints
      respond_to do |format|
        format.js # views/routes/update.js.erb
      end
    else
      raise
    end
  end

  def filter

  end

  def fetch_wikipedia_data
    @route = Route.find(params[:route_id])
    authorize @route
    Rails.logger.info @route
    # @info = @route.sights.map do |sight|
    #   @page = Wikipedia.find (sight.name)
    #   {description: @page.text.first(400), picture_url: @page.image_urls[1]}
    # end
    # @page = Wikipedia.find( @route.sights.last.name )
    # @page.title
    @waypoints = @route.sights.map do |sight|
      {lat: sight.latitude, lng: sight.longitude}
    end
    respond_to do |format|
      format.json {render json: @waypoints}
    end
  end

  def destroy
    @route.destroy
    authorize @route
    redirect_to routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
    authorize @route
  end

  def params_route
    params.require(:route).permit(:name, :description, :photo, :photo_cache, route_pictures_attributes: [:id, :route_id, :route_picture])
  end

  def params_city
    params.require(:route).permit(:city)
  end
end
