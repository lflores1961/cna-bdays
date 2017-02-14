require 'test_helper'

class MensajesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit for cumpleaños" do
    get edit_mensaje_path('cumpleaños')
    assert_response :success
  end

end
