class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render :show
  end

  def create
    # carted_products = current_user.carted_products.where(status: params["carted"])

    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    # calculated_subtotal = carted_products.price * params[:quantity].to_i
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    # carted_products.each do |carted_product|

    # end
    #comment

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    if @order.save
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: 418
    end
  end
end
