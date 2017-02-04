require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

def setup
  @base_title = "Colegio de Notarios"
end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Inicio | #{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Ayuda | #{@base_title}"
  end

end
