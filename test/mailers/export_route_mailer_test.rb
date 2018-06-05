require 'test_helper'

class ExportRouteMailerTest < ActionMailer::TestCase
  test "send_route" do
    mail = ExportRouteMailer.send_route
    assert_equal "Send route", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
