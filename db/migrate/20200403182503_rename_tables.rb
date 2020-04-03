class RenameTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :topics, :shops
  end
end