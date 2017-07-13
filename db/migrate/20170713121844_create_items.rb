class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :stock, null: false
      t.text :introduction, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
