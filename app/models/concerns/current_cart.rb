module CurrentCart

	private

	def set_cart
		if current_user != nil
			@cart = Cart.find_by(user_id: current_user.id)
			if @cart == nil
				return @cart = Cart.create(user_id: current_user.id)
			end
		end
	end
end