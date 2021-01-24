require 'test_helper'

class LicenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end
  test "should get new" do
    get licenciar_path(@member)
    assert_response :success
  end

end
