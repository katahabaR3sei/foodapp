class RemoveNameFromShops < ActiveRecord::Migration[6.0]
  def change

    remove_column :shops, :genre, :string
  end
end
