class Item < ApplicationRecord
  has_one :image
  has_many :reviews
end
