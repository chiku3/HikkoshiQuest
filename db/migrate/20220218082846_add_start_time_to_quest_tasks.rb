class AddStartTimeToQuestTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :quest_tasks, :start_time, :datetime
  end
end
