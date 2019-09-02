class Item < ApplicationRecord
	validates :description, presence: true
	validates :title, presence: true
	validates :price, presence: true
	
end
