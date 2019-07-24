class AddCoordinatesToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :latitude, :float
    add_column :ngos, :longitude, :float
  end
end
