class WarehouseRecord < ApplicationRecord
  belongs_to :supplier, optional: true
  belongs_to :user
  has_many :warehouse_details, dependent: :destroy
end
