class ChangeColumnDefaultToQuests < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quests, :is_clear, from: nil, to: false
  end
end
