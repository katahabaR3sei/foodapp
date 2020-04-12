class AddAddressIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address_id, :integer
  end
end
