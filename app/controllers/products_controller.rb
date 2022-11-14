class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      # image_url: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )
    if @product.save #happy path
      render json: @product.as_json
    else #sad path
      render json: { errors: @product.errors.full_messages }, status: 418
    end
  end

  def update
    product = Product.find_by(id: params["id"])

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    # product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    if product.save
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: 418
    end
    # @product = product

  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "Product successfully destroyed" }
  end
end
