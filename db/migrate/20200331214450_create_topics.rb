class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :store_name
      t.integer :user_id
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
