class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :title
      t.date :due_day
      t.string :start_point
      t.string :start_point_city
      t.string :goal_point
      t.string :goal_point_city
      t.boolean :is_clear

      t.timestamps
    end
  end
end
