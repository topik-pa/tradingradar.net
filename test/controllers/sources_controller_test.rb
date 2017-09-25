require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get source1" do
    get sources_source1_url
    assert_response :success
  end

  test "should get source2" do
    get sources_source2_url
    assert_response :success
  end

  test "should get source3" do
    get sources_source3_url
    assert_response :success
  end

  test "should get source4" do
    get sources_source4_url
    assert_response :success
  end

  test "should get source5" do
    get sources_source5_url
    assert_response :success
  end

  test "should get source6" do
    get sources_source6_url
    assert_response :success
  end

end
