class ChangeDataDueDayToQuests < ActiveRecord::Migration[5.2]
  def change
    change_column :quests, :due_day, :datetime
  end
end
