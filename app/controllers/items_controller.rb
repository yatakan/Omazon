class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
    if @reviews.present?
      @count = @reviews.group(:rate).order('rate DESC').count
      @count_keys = @count.keys
      @count_values = @count.values
      @sum = @count_values.inject{ |sum, n| sum + n }
      @yellows = []
      @count_values.each do |value|
        percent = 100 / @sum * value
        if percent < 21
          @yellows << "rate-20"
        elsif percent < 41
          @yellows << "rate-40"
        elsif percent < 61
          @yellows << "rate-60"
        elsif percent < 81
          @yellows << "rate-80"
        elsif percent > 81
          @yellows << "rate-100"
        end
      end
    end
  end

  def search
    if params[:category].present?
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").where(category_id:"#{params[:category]}").includes(:reviews) if params[:keyword].present?
    else
      @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").includes(:reviews) if params[:keyword].present?
    end
  end
end
