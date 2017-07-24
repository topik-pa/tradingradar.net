require 'test_helper'

class FilterOneControllerTest < ActionDispatch::IntegrationTest
  test "should get filter" do
    get filter_one_filter_url
    assert_response :success
  end

end
