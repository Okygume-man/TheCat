class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
    has_many :items, through: :cart_items

    def add_item(params)
        
    	current_item = cart_items.find_by(item_id: params[:id])
    	if current_item
    		current_item.increment(:quantity)
    	else
    		current_item = cart_items.build(item_id: params[:id])
    	end
    	current_item
        
    end

    def total_price
        cart_items.to_a.sum { |item| item.total_price }
    end

    private

end
