class AddGenreIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :genre_id, :integer
  end
end
