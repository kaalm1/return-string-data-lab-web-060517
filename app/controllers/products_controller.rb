class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory != 0
      render text: "true"
    else
      render text: "false"
    end
  end

  def description
    @product = Product.find(params[:id])
    render text: "#{@product.description}"
  end

  def info
    @product = Product.find(params[:id])
    if @product.inventory != 0
       status = "Available"
    else
      status = "Sold Out"
    end
    render text: "#{@product.description} #{status}"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description,:inventory,:price)
  end
end
