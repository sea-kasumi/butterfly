require 'test_helper'

class InfectionControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get infection_top_url
    assert_response :success
  end

end
