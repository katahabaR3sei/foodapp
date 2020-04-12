class AddPrefecturesToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :prefectures, :string
  end
end
