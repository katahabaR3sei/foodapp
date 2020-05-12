require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_shop_post_url(shops(:one))
    assert_response :success
  end

end
