require 'test_helper'

class StudyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_page_index_url
    assert_response :success
  end

end
