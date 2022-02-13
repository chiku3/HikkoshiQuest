class AddColimnsToQuests < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :start_pref, :string
    add_column :quests, :start_city, :string
    add_column :quests, :goal_pref, :string
    add_column :quests, :goal_city, :string
  end
end
