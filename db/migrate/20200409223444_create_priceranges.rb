class CreatePriceranges < ActiveRecord::Migration[6.0]
  def change
    create_table :priceranges do |t|
      t.string :price

      t.timestamps
    end
  end
end
