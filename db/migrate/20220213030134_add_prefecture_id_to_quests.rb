class AddPrefectureIdToQuests < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :prefecture_id, :integer
  end
end
