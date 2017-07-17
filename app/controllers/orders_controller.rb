class OrdersController < ApplicationController
  def index
  end
  def new
    @order = Order.new
    @addresses = current_user.address
  end
  def create
  end
  def edit
  end
  def update
  end
end
