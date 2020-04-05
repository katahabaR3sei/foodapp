class RenameUserIdColumnToGenres < ActiveRecord::Migration[6.0]
  def change
    rename_column :genres, :user_id, :shop_id
  end
end
