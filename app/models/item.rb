class Item < ApplicationRecord
	validates :description, presence: true
	validates :title, presence: true
	validates :price, presence: true

	  has_many :cart_items
     has_many :carts, through: :cart_items
	
end
