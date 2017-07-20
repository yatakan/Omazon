class AddQuantityToShoppings < ActiveRecord::Migration[5.0]
  def change
    add_column :shoppings, :quantity, :integer
  end
end
