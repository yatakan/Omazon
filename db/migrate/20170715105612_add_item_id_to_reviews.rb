class AddItemIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :item, null: false
  end
end
