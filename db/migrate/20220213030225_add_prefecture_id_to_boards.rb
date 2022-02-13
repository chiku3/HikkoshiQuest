class AddPrefectureIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :prefecture_id, :integer
  end
end
