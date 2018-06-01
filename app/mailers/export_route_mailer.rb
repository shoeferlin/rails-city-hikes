class ExportRouteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.export_route_mailer.send_route.subject
  #
  def send_route(user, route, gmaps_url)
    @user = user
    @gmaps_url = gmaps_url
    @route = route

    mail(to: @user.email, subject: 'City Hikes - Your Exported Route')
  end
end
