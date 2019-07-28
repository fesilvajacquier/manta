class AddStatusToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :status, :integer
  end
end
