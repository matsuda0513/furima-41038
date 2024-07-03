class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.references :user, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :postage_payer_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :ship_date_estimate_id, null: false
      t.timestamps
    end
  end
end
