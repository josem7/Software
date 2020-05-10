require 'test_helper'

class JoinCursosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_cursos_new_url
    assert_response :success
  end

end
