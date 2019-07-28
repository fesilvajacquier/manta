class AddCategoryReferencesToPublications < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :category, :string
    remove_column :publications, :sub_category, :string
    add_reference :publications, :category, index: true
  end
end
