class AddNameToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :name, :string
  end
end
