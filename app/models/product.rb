class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :warehouse_records

  mount_uploader :imagen, ImagenProductoUploader
end
