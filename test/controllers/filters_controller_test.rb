require 'test_helper'

class FiltersControllerTest < ActionDispatch::IntegrationTest
  test "should get filter_1" do
    get filters_filter_1_url
    assert_response :success
  end

  test "should get filter_2" do
    get filters_filter_2_url
    assert_response :success
  end

  test "should get filter_3" do
    get filters_filter_3_url
    assert_response :success
  end

  test "should get filter_4" do
    get filters_filter_4_url
    assert_response :success
  end

  test "should get filter_5" do
    get filters_filter_5_url
    assert_response :success
  end

  test "should get filter_6" do
    get filters_filter_6_url
    assert_response :success
  end

end
