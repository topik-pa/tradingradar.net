require 'test_helper'

class StockPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_page_index_url
    assert_response :success
  end

end
