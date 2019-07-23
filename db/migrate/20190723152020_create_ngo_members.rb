class CreateNgoMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :ngo_members do |t|
      t.references :user, foreign_key: true
      t.references :ngo, foreign_key: true

      t.timestamps
    end
  end
end
