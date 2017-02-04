require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal   full_title, "Colegio de Notarios"
    assert_equal   full_title("Ayuda"), "Ayuda | Colegio de Notarios"
  end

end
