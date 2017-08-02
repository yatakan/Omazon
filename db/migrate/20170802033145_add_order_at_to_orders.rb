class AddOrderAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_at, :datetime
  end
end
