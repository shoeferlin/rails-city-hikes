class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]


  def index
   @routes = policy_scope(Route).order(created_at: :asc)
   # @routes = Route.all
  end

  def show

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
    @sight = Sight.new()
  end

  def update
  end

  def destroy
  end

  def export
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

  def params_sight
   params.require(:sight).permit(:locality, :country, :photo, :photo_cache)
  end
end
