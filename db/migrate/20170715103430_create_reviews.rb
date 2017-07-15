class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :rate, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :like, default: 0
      t.timestamps
    end
  end
end
