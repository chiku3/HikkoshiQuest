require 'test_helper'

class Admin::BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_boards_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_boards_destroy_url
    assert_response :success
  end

end
