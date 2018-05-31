class ExportsController < ApplicationController
  before_action :set_route, only: [ :show, :send_route_email, :send_route_phone, :send_route_clipboard, :send_route_gmaps, :send_route_friend]

  def show
    @export = Export.new
    authorize @export
  end

  def send_route_email
    @export = Export.new
    authorize @export
    flash[:notice] = "Route has been sent to your email, #{@route.user.first_name}"
    # start background job writing email with link
    redirect_to route_export_path(@route)
    # redirect_to route_path(@route)
  end

  def send_route_phone
    @export = Export.new
    authorize @export
    flash[:notice] = "Route has been sent to your phone, #{@route.user.first_name}"
    # start background job sending a text via API with link
    redirect_to route_export_path(@route)
    # redirect_to route_path(@route)
  end

  def send_route_clipboard
    @export = Export.new
    authorize @export
    flash[:notice] = "Route is now in your clipboard, #{@route.user.first_name}"
    # copy to clipboard action
    redirect_to route_export_path(@route)
    # redirect_to route_path(@route)
  end

  def send_route_gmaps
    @export = Export.new
    authorize @export
    flash[:notice] = "We are opening Google Maps for you, #{@route.user.first_name}"
    # open google maps in a new tab
    redirect_to route_export_path(@route)
    # redirect_to route_path(@route)
  end

  def send_route_friend
    @export = Export.new
    authorize @export
    flash[:notice] = "Route has been sent to your friend, #{@route.user.first_name}"
    # start background job sending email with link to address of friend
    redirect_to route_export_path(@route)
    # redirect_to route_path(@route)
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
    # authorize @route
  end
end
