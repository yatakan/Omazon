class Item < ApplicationRecord
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_one :image
  has_many :reviews
  has_many :carts, through: :shoppings
  has_many :shoppings
end
