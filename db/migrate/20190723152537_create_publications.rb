class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.references :ngo, foreign_key: true
      t.string :title
      t.text :description
      t.text :intended_use
      t.string :category
      t.string :sub_category
      t.string :location

      t.timestamps
    end
  end
end
