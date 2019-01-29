class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sales_params)
    @sale.total = @sale.value * (100 - @sale.discount) / 100
    if @sale.tax == 0
      @sale.total = @sale.total * 1.19
      @sale.tax = 19
    else
      @sale.tax = 0
    end
    @sale.save
    redirect_to sales_path
  end

  private

  def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end


end
