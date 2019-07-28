class AddCategoryToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :category, :integer
  end
end
