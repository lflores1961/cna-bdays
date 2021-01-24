require 'test_helper'

class ReconocimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end
  
  test "should get new" do
    get reconocer_path(@member)
    assert_response :success
  end

end
