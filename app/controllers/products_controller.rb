class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: "Baby Octopus",
      price: 5,
      image_url: "https://images4-f.ravelrycache.com/uploads/AllFromJade/722750265/IMG_0660_small2.JPG",
      description: "Tiny baby octopus that can be customized into aliens (three eyes) or cyclopes (one eye)",
    )
    product.save
    render json: product.as_json
  end

  # def all_products
  #   products = Product.all
  #   render json: products.as_json
  # end

  # def first_product
  #   product = Product.first
  #   render json: product.as_json
  # end

  # def second_product
  #   product = Product.second
  #   render json: product.as_json
  # end

end
