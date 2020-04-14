class AddColumnPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :atmosphere, :text
    add_column :posts, :service, :text
  end
end