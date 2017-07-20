class CreateShoppings < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppings do |t|
      t.integer null: false
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.timestamps
    end
  end
end
