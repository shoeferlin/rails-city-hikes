class ExportRouteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.export_route_mailer.send_route.subject
  #
  def send_route_email(user, route, gmaps_url)
    @user = user
    @gmaps_url = gmaps_url
    @route = route

    mail(to: @user.email, subject: "City Hikes - Your Exported Route")
  end

  def send_route_friend(user, route, gmaps_url, friend_name, friend_email)
    @user = user
    @gmaps_url = gmaps_url
    @route = route

    @friend_name = friend_name

    mail(to: friend_email, subject: "City Hikes - Your friend #{@user.first_name} sent you a route")
  end
end
