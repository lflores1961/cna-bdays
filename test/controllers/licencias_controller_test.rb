require 'test_helper'

class LicenciasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get licencias_index_url
    assert_response :success
  end

  test "should get new" do
    get licencias_new_url
    assert_response :success
  end

  test "should get show" do
    get licencias_show_url
    assert_response :success
  end

  test "should get edit" do
    get licencias_edit_url
    assert_response :success
  end

end
