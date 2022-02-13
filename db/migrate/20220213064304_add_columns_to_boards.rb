class AddColumnsToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :prefecture, :string
    add_column :boards, :city, :string
  end
end
