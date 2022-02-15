class ChangeColumnDefaultToQuestTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quest_tasks, :is_clear, from: nil, to: false
  end
end