require 'test_helper'

class ClearQuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clear_quests_show_url
    assert_response :success
  end

end
