require "test_helper"

class ItemsDePedidosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_de_pedidos_index_url
    assert_response :success
  end

  test "should get new" do
    get items_de_pedidos_new_url
    assert_response :success
  end

  test "should get show" do
    get items_de_pedidos_show_url
    assert_response :success
  end
end
