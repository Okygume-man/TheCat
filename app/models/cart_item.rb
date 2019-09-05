class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  def total_price
  	item.price.to_i * quantity.to_i
  end
end
