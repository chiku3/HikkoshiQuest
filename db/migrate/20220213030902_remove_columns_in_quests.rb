class RemoveColumnsInQuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :quests, :start_point, :string
    remove_column :quests, :start_point_city, :string
    remove_column :quests, :goal_point, :string
    remove_column :quests, :goal_point_city, :string
  end
end
