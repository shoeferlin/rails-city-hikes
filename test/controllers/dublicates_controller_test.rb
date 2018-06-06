require 'test_helper'

class DublicatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get dublicates_create_url
    assert_response :success
  end

end
