class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
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

  def add_item
    if @shopping.blank?
      @shopping = current_cart.shoppings.new(item_id: params[:item_id], quantity: 1)
    else
      @shopping.quantity += 1
      # @shopping.quantity += params[:quantity].to_i
    end
    @shopping.save
    redirect_to current_cart
  end

  def update_item
    @shopping.update(shopping_params)
    redirect_to current_cart
  end

  def delete_item
    @shopping.destroy
    redirect_to current_cart
  end

  private
  def setup_cart_item!
    current_cart if session[:cart_id].nil?
    @shopping = current_cart.shoppings.find_by(item_id: params[:item_id])
  end

  def shopping_params
    params.require(:shopping).permit(:quantity)
  end
end
