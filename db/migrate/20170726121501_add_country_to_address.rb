class AddCountryToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :country, :string, null: false
    add_column :addresses, :post_cord, :string, null: false
    add_column :addresses, :prefecture, :string, null: false
    add_column :addresses, :company, :string
  end
end
