class AddShopIdToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :shop_id, :integer
  end
end
