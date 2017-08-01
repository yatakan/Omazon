module CulcSum
  extend ActiveSupport::Concern

  private
    def calc_sum(shoppings)
      if shoppings.present?
        sum = 0
        shoppings.each do |shopping|
        sum += (shopping.item.price * shopping.quantity).to_i
      end
      return sum
    end
  end
end
