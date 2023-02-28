class AddUserForeignKeyToDolls < ActiveRecord::Migration[7.0]
  def change
    add_reference :dolls, :user, null: false, foreign_key: true
  end
end
