class RemoveImageIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :image_id, :integer
  end
end
