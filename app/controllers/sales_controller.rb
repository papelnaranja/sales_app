class SalesController < ApplicationController
  def index
    @sales = Sale.all
    render :done
  end
  def new
    @sale = Sale.new
  end
  def create
    @sale = Sale.new(sale_params)

    if @sale.valid?
      discount = @sale.discount * @sale.value / 100
      total = @sale.value - discount
      total *= 1.19 if @sale.tax.zero?
      @sale.total = total
    end
    if @sale.save
      flash[:notice] = 'El registro fue almacenado con éxito!'
      redirect_to sales_new_path
    else
      flash[:notice] = "Los siguientes errores impidieron crear la venta:"
      render :new
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount , :tax )
  end
end
