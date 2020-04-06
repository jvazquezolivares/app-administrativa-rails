class ChangeForeignKeyForProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :categories_id, :category_id
    rename_column :products, :suppliers_id, :supplier_id
  end
end
