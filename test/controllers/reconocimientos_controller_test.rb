require 'test_helper'

class ReconocimientosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reconocimientos_index_url
    assert_response :success
  end

  test "should get show" do
    get reconocimientos_show_url
    assert_response :success
  end

  test "should get edit" do
    get reconocimientos_edit_url
    assert_response :success
  end

  test "should get new" do
    get reconocimientos_new_url
    assert_response :success
  end

  test "should get create" do
    get reconocimientos_create_url
    assert_response :success
  end

  test "should get update" do
    get reconocimientos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reconocimientos_destroy_url
    assert_response :success
  end

end
