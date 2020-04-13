class RenameDescriptionColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :description, :taste
  end
end
