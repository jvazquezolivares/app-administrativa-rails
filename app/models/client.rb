class Client < ApplicationRecord
    has_many :sales

    def self.buscador(termino)
      Client.where("nombre LIKE ?", "%#{termino}%")
    end
end
