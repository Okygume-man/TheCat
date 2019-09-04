class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
    has_many :items, through: :cart_items

    def add_item
    	current_item = cart_items.find_by(item_id: item.id)
    	if current_item
    		current_item.increment(:quantity)
    	else
    		current_item = cart_items.create(item_id: item.id)
    	end
    	current_item
    end
end
