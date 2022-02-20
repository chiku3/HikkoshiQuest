class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :choice

      t.timestamps
    end
  end
end
