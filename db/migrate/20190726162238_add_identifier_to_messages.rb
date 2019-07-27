class AddIdentifierToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :identifier, :string
  end
end
