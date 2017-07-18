class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @addresses = current_user.addresses
  end
  def create
    @id = Order.create(order_params)
    redirect_to edit_order_path(@id)
  end

  def edit
    @order = Order.find(params[:id])
    @carts = Cart.where(user_id: current_user.id)
    if @carts.present?
      @sum = 0
      @carts.each do |cart|
        @sum += (cart.item.price * cart.number)
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  private
  def order_params
    params.require(:order).permit(:address_id, :pay_type).merge(user_id: current_user.id)
  end
end
