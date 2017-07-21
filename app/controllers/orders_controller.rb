class OrdersController < ApplicationController
  before_action :authenticate_user!
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
    @shoppings  = current_cart.shoppings
    if @shoppings.present?
      @sum = 0
      @shoppings.each do |cart|
        @sum += (cart.item.price * cart.quantity)
      end
    end
    @numbers = []
    for num in 1..10 do
      @numbers << num
    end
  end

  def update
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:address_id, :pay_type).merge(user_id: current_user.id)
  end
end
