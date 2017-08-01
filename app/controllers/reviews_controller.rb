class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  def index
  end

  def show
  end

  def new
    set_item
    @review = Review.new
  end

  def create
    set_item
    @review = Review.new(review_params)
    @review.title = @review.title.sub(/fuck/, "****")
    @review.text = @review.text.sub(/fuck/, "****")
    if @review.save
      redirect_to item_path(params[:item_id])
    else
      render :new
      # redirect_to new_item_review_path(@item)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def review_rate
    @review = Review.find(params[:number])
    @review.like += 1
    @review.save
    respond_to do |format|
      format.json
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :text, :rate).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
