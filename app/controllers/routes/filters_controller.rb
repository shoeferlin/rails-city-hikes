class Routes::FiltersController < ApplicationController
  def index
    p params
    ftime = params[:time]
    fdistance = params[:distance]
    flocality = params[:city]
    freview = params[:review]

    fcityid = City.where(locality: params[:city]).ids
    p fcityid

    @routes = policy_scope(Route).where(
                  :time => 0..ftime.to_i,
                  :distance => 0..fdistance.to_i,
                  :city_id => fcityid,
                  :avg_rating => freview.to_i..5 )
    # :locality => flocality,
    # :review => freview
    p "----------------"
    p @routes


    respond_to do |format|
      format.html { render "routes/index", routes: @routes }
      format.js # views/routes/filters/index.js.erb
    end
  end
end
