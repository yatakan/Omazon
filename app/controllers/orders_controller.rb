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
    set_order
    @address = @order.address
    @shoppings  = current_cart.shoppings
    @sum = calc_sum(@shoppings)
  end

  def update
    set_order
    @user = current_user
    @shoppings = @order.cart.shoppings
    @sum = calc_sum(@shoppings)
    OrderMailer.order_mail_to_user(@user, @order, @shoppings, @sum).deliver
    OrderMailer.order_mail_to_owner(@user, @order, @shoppings, @sum).deliver
    session[:cart_id] = nil
    current_cart
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address_id, :pay_type).merge(user_id: current_user.id, cart_id: current_cart.id)
  end

end
