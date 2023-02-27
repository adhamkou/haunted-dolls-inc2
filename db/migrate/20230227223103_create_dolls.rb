class CreateDolls < ActiveRecord::Migration[7.0]
  def change
    create_table :dolls do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
