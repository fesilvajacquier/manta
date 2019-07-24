class CreateNgos < ActiveRecord::Migration[5.2]
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :website
      t.text :description
      t.integer :bank_account
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
