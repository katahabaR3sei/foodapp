class Addcolumntopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :genre, :string
  end
end
