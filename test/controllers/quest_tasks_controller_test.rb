require 'test_helper'

class QuestTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get crate" do
    get quest_tasks_crate_url
    assert_response :success
  end

  test "should get update" do
    get quest_tasks_update_url
    assert_response :success
  end

end
