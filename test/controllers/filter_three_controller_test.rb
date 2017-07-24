require 'test_helper'

class FilterThreeControllerTest < ActionDispatch::IntegrationTest
  test "should get filter" do
    get filter_three_filter_url
    assert_response :success
  end

end
