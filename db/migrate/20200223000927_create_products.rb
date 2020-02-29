class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :imagen
      t.string :nombre
      t.string :descripcion
      t.integer :existencia
      t.decimal :precio
      t.references :categories, foreign_key: true
      t.references :suppliers, foreign_key: true

      t.timestamps
    end
  end
end
