require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_shop_url
    assert_response :success
  end

end
