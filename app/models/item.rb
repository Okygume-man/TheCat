class Item < ApplicationRecord
	before_destroy :not_referenced_by_any_cart_item

	validates :description, presence: true
	validates :title, presence: true
	validates :price, presence: true

	has_many :cart_items
  has_many :carts, through: :cart_items

  private

  def not_referenced_by_any_cart_item
  	unless cart_items.empty?
  		errors.add(:base, "Cart items is present")
  		throw :abort
  	end
  end
	
end
