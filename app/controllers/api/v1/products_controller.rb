class Api::V1::ProductsController < ApplicationController
  
  #render semua data prodyc
  def index
    products = Product.all
    render json: products, status: 200
  end

  def create
    product = Product.new(
      name: p_params[:name],
      brand: p_params[:brand],
      price: p_params[:price],
      description: p_params[:description],
    )
    if product.save
      render json: product, status: 200
    else
      render json: {error: "Erroe create ."}
    end
  end

  def show
    product = Product.find_by(id:params[:id])
    if product
      render json: product, status: 200
    else
      render json: {error: "Produk NOt found"}
    end
  end


  private 
    def p_params
      params.require(:product).permit([
        :name,
        :brand, 
        :price,
        :description,
      ])
    end
end
