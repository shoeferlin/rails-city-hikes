class ExportsController < ApplicationController
  before_action :set_route, only: [:show, :send_route]

  def show
    @export = Export.new
    authorize @export
  end

  def send_route_email
  end

  def send_route_phone
  end

  def send_route_friend
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
    authorize @route
  end
end
