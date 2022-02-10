class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :quest_id
      t.string :title
      t.text :detail
      t.text :hint
      t.date :do_time
      t.integer :importance
      t.string :enemy_image_id
      t.boolean :is_clear

      t.timestamps
    end
  end
end
