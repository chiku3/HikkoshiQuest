class RemoveColumsInTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :quest_id, :integer
    remove_column :tasks, :hint, :text
    remove_column :tasks, :is_clear, :boolean
    remove_column :tasks, :do_time, :date
  end
end
