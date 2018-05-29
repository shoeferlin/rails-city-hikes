require 'test_helper'

class ExportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exports_index_url
    assert_response :success
  end

end
