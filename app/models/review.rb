class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :rate, numericality: { only_integer: true, less_than_or_equal_to: 5 }
  validates :title, length: { maximum: 18 }
end
