class RemoveNumberFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :number, :integer
  end
end
