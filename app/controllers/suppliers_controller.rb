class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:edit, :update, :destroy]

  def index
    @proveedores = Supplier.all
  end

  def new
    @proveedor = Supplier.new
  end

  def edit
  end

  def create
    @proveedor = Supplier.new(supplier_params)
    
    respond_to do |format|
      if @proveedor.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @proveedor.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @proveedor.update(supplier_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @proveedor.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @proveedor.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_supplier
    @proveedor = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:nombre, :direccion, :telefono)
  end

end