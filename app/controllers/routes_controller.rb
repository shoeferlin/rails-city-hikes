class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :fetch_wikipedia_data]
  protect_from_forgery except: :fetch_wikipedia_data

  def index
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
    @waypoints = @route.sights.map do |sight|
      {lat: sight.latitude, lng: sight.longitude}
    end
  end

  def new
    @route = Route.new
    @cities = City.all
    authorize @route
  end

  def create
    @route = Route.new(params_route)
    @route.city = City.find(params_city[:city])
    @route.user = current_user
    authorize @route
    if @route.save
      redirect_to route_path(@route)
    else
      render :new
    end
  end

  def edit
    @sight = Sight.new
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
    params.require(:route).permit(:name, :description, :photo, :photo_cache)
  end

  def params_city
    params.require(:route).permit(:city)
  end

end
