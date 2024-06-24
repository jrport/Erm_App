require "test_helper"

class ItemsDeComprasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_de_compras_index_url
    assert_response :success
  end

  test "should get show" do
    get items_de_compras_show_url
    assert_response :success
  end

  test "should get new" do
    get items_de_compras_new_url
    assert_response :success
  end

  test "should get create" do
    get items_de_compras_create_url
    assert_response :success
  end

  test "should get delete" do
    get items_de_compras_delete_url
    assert_response :success
  end

  test "should get update" do
    get items_de_compras_update_url
    assert_response :success
  end

  test "should get edit" do
    get items_de_compras_edit_url
    assert_response :success
  end
end
