class ChangeColumnsToBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :prefecture_id, :integer
    remove_column :boards, :prefecture, :string
    remove_column :boards, :city, :string
    add_column :boards, :body, :text
  end
end
