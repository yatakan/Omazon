class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  def carc_sum(cart)
  end
end
