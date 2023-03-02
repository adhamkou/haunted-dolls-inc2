class AddCoordinatesToDolls < ActiveRecord::Migration[7.0]
  def change
    add_column :dolls, :latitude, :float
    add_column :dolls, :longitude, :float
  end
end
