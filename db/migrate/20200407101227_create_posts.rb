class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :title
      t.integer :shop_id
      t.float :rate
      t.timestamps
    end
  end
end
