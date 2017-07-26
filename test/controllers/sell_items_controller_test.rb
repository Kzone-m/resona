require 'test_helper'

class SellItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sell_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get sell_items_edit_url
    assert_response :success
  end

end
