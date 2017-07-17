class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carts = Cart.where(user_id: current_user.id)
    if @carts.present?
      @sum = 0
      @carts.each do |cart|
        @sum += (cart.item.price * cart.number)
      end
    end
  end
  def create
    Cart.create(number: 1, item_id: params[:item_id], user_id: current_user.id)
    redirect_to item_path(params[:item_id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
