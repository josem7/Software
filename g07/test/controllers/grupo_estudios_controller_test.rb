require 'test_helper'

class GrupoEstudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupo_estudio = grupo_estudios(:one)
  end

  test "should get index" do
    get grupo_estudios_url
    assert_response :success
  end

  test "should get new" do
    get new_grupo_estudio_url
    assert_response :success
  end

  test "should create grupo_estudio" do
    assert_difference('GrupoEstudio.count') do
      post grupo_estudios_url, params: { grupo_estudio: { capacidad: @grupo_estudio.capacidad, curso: @grupo_estudio.curso, fecha_creacion: @grupo_estudio.fecha_creacion, hora_termino: @grupo_estudio.hora_termino } }
    end

    assert_redirected_to grupo_estudio_url(GrupoEstudio.last)
  end

  test "should show grupo_estudio" do
    get grupo_estudio_url(@grupo_estudio)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupo_estudio_url(@grupo_estudio)
    assert_response :success
  end

  test "should update grupo_estudio" do
    patch grupo_estudio_url(@grupo_estudio), params: { grupo_estudio: { capacidad: @grupo_estudio.capacidad, curso: @grupo_estudio.curso, fecha_creacion: @grupo_estudio.fecha_creacion, hora_termino: @grupo_estudio.hora_termino } }
    assert_redirected_to grupo_estudio_url(@grupo_estudio)
  end

  test "should destroy grupo_estudio" do
    assert_difference('GrupoEstudio.count', -1) do
      delete grupo_estudio_url(@grupo_estudio)
    end

    assert_redirected_to grupo_estudios_url
  end
end
