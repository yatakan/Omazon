class AddAddressIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :address, null: false, foreign_key: true
  end
end
