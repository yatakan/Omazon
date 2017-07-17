class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :pay_type, null: false
      t.boolean :check_out, null: false
      t.timestamps
    end
  end
end
