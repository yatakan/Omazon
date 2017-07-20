class RemoveUserFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :carts, :user, foreign_key: true
  end
end
