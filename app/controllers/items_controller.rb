class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.all
  end

  def search
    if params[:category].present?
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").where(category_id:"#{params[:category]}") if params[:keyword].present?
    else
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%") if params[:keyword].present?
    end
  end
end
