class AddPricerangeIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :pricerange_id, :integer
  end
end
