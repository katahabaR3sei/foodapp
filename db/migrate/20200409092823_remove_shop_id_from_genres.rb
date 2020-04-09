class RemoveShopIdFromGenres < ActiveRecord::Migration[6.0]
  def change
    remove_column :genres, :shop_id, :integer
  end
end
