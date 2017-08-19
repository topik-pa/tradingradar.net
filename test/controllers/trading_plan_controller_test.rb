require 'test_helper'

class TradingPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trading_plan_index_url
    assert_response :success
  end

end
