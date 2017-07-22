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
    @address = @order.address
    @shoppings  = current_cart.shoppings
    if @shoppings.present?
      @sum = 0
      @shoppings.each do |cart|
        @sum += (cart.item.price * cart.quantity)
      end
    end
  end

  def update
    @user = current_user
    @order = Order.find(params[:id])
    OrderMailer.order_mail_to_user(@user, @order).deliver
    session[:cart_id] = nil
    current_cart
  end

  private
  def order_params
    params.require(:order).permit(:address_id, :pay_type).merge(user_id: current_user.id, cart_id: current_cart.id)
  end
end
