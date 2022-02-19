class RemoveImportanceFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :importance, :integer
  end
end
