class RemoveColumnsInBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :category_id, :integer
    remove_column :boards, :point, :string
    remove_column :boards, :city_point, :string
  end
end
