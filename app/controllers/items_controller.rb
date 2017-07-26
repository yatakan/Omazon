class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

  def search
    if params[:category].present?
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").where(category_id:"#{params[:category]}").includes(:reviews) if params[:keyword].present?
    else
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").includes(:reviews) if params[:keyword].present?
    end
  end
end
