class WarehousesController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :add_item, :destroy, :add_proveedor]

  def index
    @entradas_almacen = WarehouseRecord.all
  end

  def show
  end

  def new
    @entrada_almacen = current_user.warehouse_records.create
    redirect_to edit_warehouse_path(@entrada_almacen)
  end 

  def edit
    @entradas_almacen = @entrada_almacen.warehouse_details
  end

  def destroy

    ActiveRecord::Base.transaction do
      @entrada_almacen.warehouse_details.map do |detail|
        prod_registrado = Product.find(detail.product_id)
        prod_registrado.existencia-= detail.cantidad
        ActiveRecord::Rollback unless prod_registrado.save
      end
  
      ActiveRecord::Rollback unless @entrada_almacen.destroy
    end

    respond_to do |format|
      format.html { redirect_to warehouses_path, notice: "La entrada ha sido eliminada" }
      format.json { head :no_content }
    end
  end

  def add_item
    producto = Product.find(params[:product_id])
    cantidad = params[:cantidad].nil? ? 1 : params[:cantidad].to_i
    @detalle_entrada = @entrada_almacen.warehouse_details.build(product: producto, cantidad: cantidad)

    existencia_antes_entrada = producto.existencia

    result = {
      product_id:      @detalle_entrada.product_id,
      producto:        @detalle_entrada.product.try(:nombre),
      cantidad:        @detalle_entrada.cantidad
    }

    producto.existencia  = existencia_antes_entrada + cantidad

    respond_to do |format|
      if @entrada_almacen.save && producto.save
        format.json { render json: result }
      else
        format.json { render json: @entrada_almacen.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def add_proveedor
    proveedor = Supplier.find(params[:proveedor_id])
    if proveedor.present?
      @entrada_almacen.supplier = proveedor
      if @entrada_almacen.valid?
        result = { nombre_proveedor: @entrada_almacen.supplier.try(:nombre) }

        respond_to do |format|
          if @entrada_almacen.save
            format.json { render json: result }
          else
            format.json { render json: @entrada_almacen.errors.full_messages, status: :unprocessable_entity }
          end
        end
      end
    else
      render json: { message: "El proveedor no se encontró" }, status: :not_found
    end
  end

  private

  def set_entrada
    @entrada_almacen = WarehouseRecord.find(params[:id])
  end

end