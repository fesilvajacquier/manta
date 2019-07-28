class AddClosingTextToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :closing_text, :text
  end
end
