class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @shoppings  = current_cart.shoppings
  end

  def add_item
    if @shopping.blank?
      @shopping = current_cart.shoppings.new(item_id: params[:item_id], quantity: 1)
    end
    @shopping.quantity += 1
    # @shopping.quantity += params[:quantity].to_i
    @shopping.save
    redirect_to item_path(params[:item_id])
  end

  def update_item
    @shopping.update(quantity: params[:quantity].to_i)
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
end
