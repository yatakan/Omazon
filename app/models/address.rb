class Address < ApplicationRecord
  belongs_to :user

  validates :name, :tel, :address, :country, :post_cord, :prefecture, presence: true
  validates :post_cord, format: { with: /[0-9]{7}/, message: "は半角英数で入力してください"}, length: { is: 7, message: "は7桁で入力してください" }
  validates :tel, format: { with: /[0-9+]/, message: "は半角英数で入力してください" }
end
