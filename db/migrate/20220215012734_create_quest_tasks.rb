class CreateQuestTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :quest_tasks do |t|
      t.integer :quest_id
      t.integer :task_id
      t.boolean :is_clear

      t.timestamps
    end
  end
end
