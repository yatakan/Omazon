class RemoveItemIdFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :carts, :item, foreign_key: true
  end
end
