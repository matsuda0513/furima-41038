class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.integer    :item_id     , null: false
      t.timestamps
    end
  end
end
