class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :cart

  validates :address_id, presence: true
  validates :pay_type, presence: true

end
