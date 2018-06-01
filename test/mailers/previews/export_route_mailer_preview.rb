# Preview all emails at http://localhost:3000/rails/mailers/export_route_mailer
class ExportRouteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/export_route_mailer/send_route
  def send_route
    ExportRouteMailer.send_route
  end

end
