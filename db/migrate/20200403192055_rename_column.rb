class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :store_name, :name
  end
end
