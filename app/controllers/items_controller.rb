class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%")
  end
end
