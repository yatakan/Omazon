class ChangeColumnToShoppings < ActiveRecord::Migration[5.0]
  def up
    change_column :shoppings, :quantity, :integer, null: false, default: 0
  end

  def down
    change_column :shoppings, :quantity, :integer, null: true
  end
end
