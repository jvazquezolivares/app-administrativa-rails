class CreateWarehouseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_details do |t|
      t.integer :cantidad
      t.references :product, foreign_key: true
      t.references :warehouse_record, foreign_key: true

      t.timestamps
    end
  end
end
