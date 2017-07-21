class AddDestroyAtToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :destroy_at, :datetime
  end
end
