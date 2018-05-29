class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]


  def index
   @routes = policy_scope(Route).order(created_at: :asc)
   @routes = Route.all
  end

  def show

  end

  def new
    @route = Route.new
    authorize @route
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def export
  end

  def search

  end

  private

  def set_route
    @route = Route.find(params[:id])
    authorize @route
  end

  def route_params
    params.require(:route).permit(:term)

  end
end
