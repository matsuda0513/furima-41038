class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.integer :item_id, null: false
      t.integer :address_id, null: false
      t.timestamps
    end
  end
end
