class CreateBases < ActiveRecord::Migration[5.1]
  def change
    create_table :bases do |t|
      t.string :name
      t.string :base_number
      t.string :base_type

      t.timestamps
    end
  end
end
