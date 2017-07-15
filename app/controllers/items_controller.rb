class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    if params[:category].present?
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").where(category_id:"#{params[:category]}")
    else
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%")
    end
  end
end
