require 'test_helper'

class JoinEventControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_event_new_url
    assert_response :success
  end

end
