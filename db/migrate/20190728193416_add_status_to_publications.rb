class AddStatusToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :status, :integer, default: 0
  end
end
