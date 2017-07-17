class ChangeColumnFromOrders < ActiveRecord::Migration[5.0]
  def up
    change_column :orders, :check_out, :boolean, null: false, default: 0
  end

  #変更前の型
  def down
    change_column :orders, :check_out, :boolean, null: false
  end
end
