class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :tel, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
