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
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:address_id, :pay_type).merge(user_id: current_user.id)
  end
end
