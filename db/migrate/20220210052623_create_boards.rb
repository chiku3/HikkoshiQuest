class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :category_id
      t.string :title
      t.string :point
      t.string :city_point

      t.timestamps
    end
  end
end
