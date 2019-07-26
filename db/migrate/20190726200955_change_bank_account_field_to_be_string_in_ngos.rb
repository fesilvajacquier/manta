class ChangeBankAccountFieldToBeStringInNgos < ActiveRecord::Migration[5.2]
  def change
    change_column :ngos, :bank_account, :string
  end
end
