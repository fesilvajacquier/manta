class RemoveUserIdFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :user_id
    add_column :reports, :phone_number, :string
  end
end
