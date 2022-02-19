class RemovePrefectureIdFromQuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :quests, :prefecture_id, :integer
  end
end
