require 'test_helper'

class SalaOcupadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sala_ocupada = sala_ocupadas(:one)
  end

  test "should get index" do
    get sala_ocupadas_url
    assert_response :success
  end

  test "should get new" do
    get new_sala_ocupada_url
    assert_response :success
  end

  test "should create sala_ocupada" do
    assert_difference('SalaOcupada.count') do
      post sala_ocupadas_url, params: { sala_ocupada: { evento: @sala_ocupada.evento, hora_termino: @sala_ocupada.hora_termino, sala: @sala_ocupada.sala } }
    end

    assert_redirected_to sala_ocupada_url(SalaOcupada.last)
  end

  test "should show sala_ocupada" do
    get sala_ocupada_url(@sala_ocupada)
    assert_response :success
  end

  test "should get edit" do
    get edit_sala_ocupada_url(@sala_ocupada)
    assert_response :success
  end

  test "should update sala_ocupada" do
    patch sala_ocupada_url(@sala_ocupada), params: { sala_ocupada: { evento: @sala_ocupada.evento, hora_termino: @sala_ocupada.hora_termino, sala: @sala_ocupada.sala } }
    assert_redirected_to sala_ocupada_url(@sala_ocupada)
  end

  test "should destroy sala_ocupada" do
    assert_difference('SalaOcupada.count', -1) do
      delete sala_ocupada_url(@sala_ocupada)
    end

    assert_redirected_to sala_ocupadas_url
  end
end
