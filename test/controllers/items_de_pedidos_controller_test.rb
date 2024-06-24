require "test_helper"

class ItemsDePedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get items_de_pedidos_new_url
    assert_response :success
  end

  test "should get update" do
    get items_de_pedidos_update_url
    assert_response :success
  end
  test "should get create" do
    get items_de_pedidos_create_url
    assert_response :success
  end

  test "should get update" do
    get items_de_pedidos_update_url
    assert_response :success
  end
end
