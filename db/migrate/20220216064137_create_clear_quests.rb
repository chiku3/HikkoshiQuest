class CreateClearQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :clear_quests do |t|
      t.integer :user_id
      t.date :clear_day
      t.string :start_pref
      t.string :start_city
      t.string :goal_pref
      t.string :goal_city

      t.timestamps
    end
  end
end
