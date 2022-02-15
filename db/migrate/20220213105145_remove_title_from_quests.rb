class RemoveTitleFromQuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :quests, :title, :string
  end
end
