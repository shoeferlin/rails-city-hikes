class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :fetch_wikipedia_data]
  protect_from_forgery except: :fetch_wikipedia_data

  def index
    @route_pictures = RoutePicture.all
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
    # @routes = Route.all
  end

  def show
    # @route.waypoints.each do |waypoint|
    #    waypoint.last.list_nr.sort_by {|i| i}
    #   raise
    # end
    @route.waypoints.sort_by {|i| i.list_nr}
    @waypoints = @route.sights.map do |sight|
      {lat: sight.latitude, lng: sight.longitude}
    @route_pictures = @route.route_pictures.all
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
    authorize @route
    if @route.save
      unless params['route_pictures'].nil?
        params[:route_pictures]['route_pictures'].each do |a|
          @route_pictures = @route.route_pictures.create!(route_picture: a, route_id: @route.id)
        end
      end
      redirect_to route_path(@route)
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
    # @route.waypoints.sort_by {|i| i.list_nr}
    @waypoints = @route.sights.map do |sight|
      {lat: sight.latitude, lng: sight.longitude}
    end
  end

  def update
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
    raise
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
