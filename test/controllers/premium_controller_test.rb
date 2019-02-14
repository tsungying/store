require 'test_helper'

class PremiumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get premiums_url
    assert_response :success
  end

end
