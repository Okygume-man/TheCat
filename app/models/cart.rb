class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
    has_many :items, through: :cart_items

    def add_item(params)
        
    	current_item = cart_items.find_by(item_id: params[:id])
    	if current_item
    		current_item.quantity = current_item.quantity + 1
    	else
    		current_item = cart_items.build(item_id: params[:id])
    	end
    	current_item
        
    end

    def create_or_select_Cart_Item(cart_item_params)
      if CartItem.find_by(cart_id: cart_item_params.cart_id, item_id: cart_item_params.item_id) == nil
        @cart_item = CartItem.create(cart_id: cart_item_params.cart_id, item_id: cart_item_params.item_id)
      else
        @cart_item = CartItem.find_by(cart_id: cart_item_params.cart_id, item_id: cart_item_params.item_id)
        @cart_item.update(quantity: @cart_item.quantity + 1)
      end
    end

    def total_price
        cart_items.to_a.sum { |item| item.total_price }
    end

    private

end
