class WarehouseDetail < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse_record
end
