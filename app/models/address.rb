class Address < ApplicationRecord
  belongs_to :user

  validates :name, :tel, :address, presence: true
end
