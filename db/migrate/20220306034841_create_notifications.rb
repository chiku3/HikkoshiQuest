class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, foreign_key: { to_table: :users }, null: false
      t.integer :visited_id, foreign_key: { to_table: :users }, null: false
      t.integer :board_id
      t.integer :comment_id
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
