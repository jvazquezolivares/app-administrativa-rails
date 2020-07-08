class SearchController < ApplicationController
  def results
    @productos = Product.buscador(params[:termino])
    @clientes = Client.buscador(params[:termino])
    @proveedores = Supplier.buscador(params[:termino])
  end
end