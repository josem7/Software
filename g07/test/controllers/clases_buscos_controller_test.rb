require 'test_helper'

class ClasesBuscosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clases_busco = clases_buscos(:one)
  end

  test "should get index" do
    get clases_buscos_url
    assert_response :success
  end

  test "should get new" do
    get new_clases_busco_url
    assert_response :success
  end

  test "should create clases_busco" do
    assert_difference('ClasesBusco.count') do
      post clases_buscos_url, params: { clases_busco: { curso: @clases_busco.curso, hora_termino: @clases_busco.hora_termino } }
    end

    assert_redirected_to clases_busco_url(ClasesBusco.last)
  end

  test "should show clases_busco" do
    get clases_busco_url(@clases_busco)
    assert_response :success
  end

  test "should get edit" do
    get edit_clases_busco_url(@clases_busco)
    assert_response :success
  end

  test "should update clases_busco" do
    patch clases_busco_url(@clases_busco), params: { clases_busco: { curso: @clases_busco.curso, hora_termino: @clases_busco.hora_termino } }
    assert_redirected_to clases_busco_url(@clases_busco)
  end

  test "should destroy clases_busco" do
    assert_difference('ClasesBusco.count', -1) do
      delete clases_busco_url(@clases_busco)
    end

    assert_redirected_to clases_buscos_url
  end
end
