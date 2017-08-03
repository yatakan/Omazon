class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  include CulcSum

  def show
    @sum = calc_sum(set_shoppings)
    @numbers = []
    for num in 1..30 do
      @numbers << num
    end
  end

  def add_item
    if @shopping.blank?
      @shopping = current_cart.shoppings.new(item_id: params[:item_id], quantity: 1)
    else
      @shopping.quantity += 1 unless @shopping.quantity >= 30
    end

    #在庫の変動
    @item = @shopping.item
    @item.stock -= 1
    @item.save

    @shopping.save
    redirect_to current_cart
  end

  def update_item
    find_shopping

    # 在庫の変動
    @item = @shopping.item
    now_quantity = @shopping.quantity
    after_quantity = params[:quantity].to_i

    if now_quantity == after_quantity
      return :false
    elsif now_quantity < after_quantity
      @item.stock -= (after_quantity - now_quantity)
    elsif now_quantity > after_quantity
      @item.stock += (now_quantity - after_quantity)
    end

    if @item.valid?
      @item.save
      if @shopping.update(update_params)
        @sum = calc_sum(set_shoppings)
        respond_to do |format|
          format.json
        end
      end
    end
  end

  def delete_item
    find_shopping
    respond_to do |format|
      format.json
    end

    #在庫の変動
    @item = @shopping.item
    @item.stock += @shopping.quantity
    @item.save

    @shopping.destroy
  end

  private
  def setup_cart_item!
    current_cart if session[:cart_id].nil?
    @shopping = current_cart.shoppings.find_by(item_id: params[:item_id])
  end

  def shopping_params
    params.require(:shopping).permit(:quantity)
  end

  def update_params
    params.permit(:quantity)
  end

  def find_shopping
    @shopping = Shopping.find(params[:item_id])
  end

  def set_shoppings
    @shoppings  = current_cart.shoppings
  end
end
