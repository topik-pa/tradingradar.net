require 'test_helper'

class ContattiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contatti_index_url
    assert_response :success
  end

end
