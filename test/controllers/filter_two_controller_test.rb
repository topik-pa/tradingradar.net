require 'test_helper'

class FilterTwoControllerTest < ActionDispatch::IntegrationTest
  test "should get filter" do
    get filter_two_filter_url
    assert_response :success
  end

end
