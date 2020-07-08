class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :foto
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :ciudad
      t.string :estado
      t.string :zip

      t.timestamps
    end
  end
end
