class AddItemIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :item, :string
  end
end
