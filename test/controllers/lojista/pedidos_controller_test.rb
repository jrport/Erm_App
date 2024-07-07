require "test_helper"

class Lojista::PedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lojista_pedidos_index_url
    assert_response :success
  end

  test "should get show" do
    get lojista_pedidos_show_url
    assert_response :success
  end

  test "should get edit" do
    get lojista_pedidos_edit_url
    assert_response :success
  end

  test "should get update" do
    get lojista_pedidos_update_url
    assert_response :success
  end

  test "should get create" do
    get lojista_pedidos_create_url
    assert_response :success
  end
end
