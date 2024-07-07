require "test_helper"

class LojistaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lojista_index_url
    assert_response :success
  end

  test "should get new" do
    get lojista_new_url
    assert_response :success
  end

  test "should get create" do
    get lojista_create_url
    assert_response :success
  end

  test "should get edit" do
    get lojista_edit_url
    assert_response :success
  end

  test "should get update" do
    get lojista_update_url
    assert_response :success
  end
end
