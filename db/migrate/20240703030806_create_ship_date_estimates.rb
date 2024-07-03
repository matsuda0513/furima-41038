class CreateShipDateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :ship_date_estimates do |t|
      t.integer    :item_id, null: false
      t.timestamps
    end
  end
end
