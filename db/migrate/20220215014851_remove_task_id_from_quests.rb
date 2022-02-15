class RemoveTaskIdFromQuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :quests, :task_id, :integer
  end
end
