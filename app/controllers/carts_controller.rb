class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @shopping = current_cart.shoppings
  end

  def add_item
    if @shopping.blank?
      @shopping = current_cart.shoppings.build(product_id: params[:product_id])
    end
    @shopping.quantity += params[:quantity].to_i
    @shopping.save
    redirect_to current_cart
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
    @cart_item = current_cart.shoppings.find_by(prodcut_id: params[:product_id])
  end
end
