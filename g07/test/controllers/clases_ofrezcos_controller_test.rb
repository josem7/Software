require 'test_helper'

class ClasesOfrezcosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clases_ofrezco = clases_ofrezcos(:one)
  end

  test "should get index" do
    get clases_ofrezcos_url
    assert_response :success
  end

  test "should get new" do
    get new_clases_ofrezco_url
    assert_response :success
  end

  test "should create clases_ofrezco" do
    assert_difference('ClasesOfrezco.count') do
      post clases_ofrezcos_url, params: { clases_ofrezco: { hora_termino: @clases_ofrezco.hora_termino, precio: @clases_ofrezco.precio, uid: @clases_ofrezco.uid } }
    end

    assert_redirected_to clases_ofrezco_url(ClasesOfrezco.last)
  end

  test "should show clases_ofrezco" do
    get clases_ofrezco_url(@clases_ofrezco)
    assert_response :success
  end

  test "should get edit" do
    get edit_clases_ofrezco_url(@clases_ofrezco)
    assert_response :success
  end

  test "should update clases_ofrezco" do
    patch clases_ofrezco_url(@clases_ofrezco), params: { clases_ofrezco: { hora_termino: @clases_ofrezco.hora_termino, precio: @clases_ofrezco.precio, uid: @clases_ofrezco.uid } }
    assert_redirected_to clases_ofrezco_url(@clases_ofrezco)
  end

  test "should destroy clases_ofrezco" do
    assert_difference('ClasesOfrezco.count', -1) do
      delete clases_ofrezco_url(@clases_ofrezco)
    end

    assert_redirected_to clases_ofrezcos_url
  end
end
