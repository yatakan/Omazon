class OrdersController < ApplicationController
  before_action :authenticate_user!
  include CulcSum

  def index
    @orders = current_user.orders.where(check_out: true).order('order_at DESC').includes(:cart, :address).page(params[:page]).per(3)
    @sum = []
    @orders.each do |order|
      @sum << calc_sum(order.cart.shoppings)
    end
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
    #メーラーに送る情報
    set_order
    @user = current_user
    @shoppings = @order.cart.shoppings
    @sum = calc_sum(@shoppings)
    OrderMailer.order_mail_to_user(@user, @order, @shoppings, @sum).deliver
    OrderMailer.order_mail_to_owner(@user, @order, @shoppings, @sum).deliver

    #カートを空にして、orderをcheckoutにする
    session[:cart_id] = nil
    @order.check_out = true
    @order.order_at = Time.now
    @order.save
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
