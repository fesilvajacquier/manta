class AddCoordinatesToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :latitude, :float
    add_column :publications, :longitude, :float
  end
end
