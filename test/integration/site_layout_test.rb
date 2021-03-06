require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]",   help_path
    get help_path
    assert_select "title",    full_title("Ayuda")
  end

end
