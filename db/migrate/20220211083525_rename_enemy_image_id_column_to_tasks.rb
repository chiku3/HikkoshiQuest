class RenameEnemyImageIdColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :enemy_image_id, :image_id
  end
end
