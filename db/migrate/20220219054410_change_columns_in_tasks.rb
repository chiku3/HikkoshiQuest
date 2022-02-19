class ChangeColumnsInTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :body, :text
    add_column :tasks, :body_a, :text
    add_column :tasks, :body_b, :text
  end
end
