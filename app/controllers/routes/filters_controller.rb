class Routes::FiltersController < ApplicationController
  def index
    p params
    ftime = params[:time]
    fdistance = params[:distance]
    flocality = params[:city]
    freview = params[:review]


    @routes = policy_scope(Route).where(:time => ftime,
              :distance => fdistance)
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
