class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :add_item, :destroy, :add_cliente]

  def index
    @ventas = Sale.all
  end

  def new
    @venta = current_user.sales.create(importe: 0.0)
    redirect_to edit_sale_path(@venta)
  end

  def show
  end

  def edit
    @productos_venta = @venta.sale_details
  end

  def destroy
    ActiveRecord::Base.transaction do
      @venta.sale_details.map do |detail|
        prod_vendido = Product.find(detail.product_id)
        prod_vendido.existencia+= detail.cantidad
        ActiveRecord::Rollback unless prod_vendido.save
      end
  
      ActiveRecord::Rollback unless @venta.destroy
    end

    respond_to do |format|
      format.html { redirect_to sales_url, notice: "La venta ha sido eliminada" }
      format.json { head :no_content }
    end
  end

  def add_item
    producto = Product.find(params[:producto_id])
    cantidad = params[:cantidad].nil? ? 1 : params[:cantidad].to_i
    importe_producto = producto.precio * cantidad
    @sale_detail = @venta.sale_details.build(product: producto, cantidad: cantidad)
    importe_antes_de_registro = @venta.importe
    importe_despues_registro = importe_antes_de_registro + importe_producto
    @venta.importe = importe_despues_registro

    existencia_antes_venta = producto.existencia
    result = {
      product_id:      @sale_detail.product_id,
      precio_producto: producto.precio.to_f,
      nombre_prod:     @sale_detail.product.try(:nombre),
      cantidad:        @sale_detail.cantidad,
      importe_item:    producto.precio * cantidad,
      importe_venta:   importe_despues_registro
    }

    producto.existencia  = existencia_antes_venta - cantidad

    respond_to do |format|
      if @venta.save && producto.save
        format.json { render json: result }
      else
        format.json { render json: @venta.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def add_cliente 
    cliente = Client.find(params[:cliente_id])
    if cliente.present?
      @venta.client = cliente
      if @venta.valid?
        result = { nombre_cliente: @venta.client.try(:nombre) }

        respond_to do |format|
          if @venta.save
            format.json { render json: result }
          else
            format.json { render json: @venta.errors.full_messages, status: :unprocessable_entity }
          end
        end
      end
    else
      render json: { message: "El cliente no se encontró" }, status: :not_found
    end
  end

  private

  def set_sale
    @venta = Sale.find(params[:id])
  end
end