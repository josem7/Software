require 'test_helper'

class JoinGrupoEstudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_grupo_estudios_new_url
    assert_response :success
  end

end
