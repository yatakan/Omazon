class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  def index
  end

  def show
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to item_path(params[:item_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:title, :text, :rate).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
