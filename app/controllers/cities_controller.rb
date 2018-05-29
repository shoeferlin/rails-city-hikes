class CitiesController < ApplicationController
  def new
    @city = City.new
    authorize @city
  end

  def create
    @city = City.new(params_city)
    authorize @city
    if @city.save
      redirect_to new_route_path
    else
      render :new
    end
  end

  private

  def params_city
    params.require(:city).permit(:name)
  end
end
