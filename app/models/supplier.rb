class Supplier < ApplicationRecord
    has_many :products
    has_many :warehouse_records

    def self.buscador(termino)
      Supplier.where("nombre    LIKE ?", "%#{termino}%")
    end
end
