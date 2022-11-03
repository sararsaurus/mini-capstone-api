class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def all_products
    products = Product.all
    render json: products.as_json
  end

  def first_product
    product = Product.first
    render json: product.as_json
  end

  def second_product
    product = Product.second
    render json: product.as_json
  end

  def one_product
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end
end
