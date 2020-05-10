require 'test_helper'

class ModeratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get moderators_new_url
    assert_response :success
  end

  test "should get create" do
    get moderators_create_url
    assert_response :success
  end

end
