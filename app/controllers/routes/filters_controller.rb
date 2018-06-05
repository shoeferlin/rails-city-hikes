class Routes::FiltersController < ApplicationController
  def index
    p params

    respond_to do |format|
      format.html { render "routes/index" }
      format.js # views/routes/filters/index.js.erb
    end
  end
end
