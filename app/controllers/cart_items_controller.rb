class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart_item, only: [ :show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  def index
    @cart_items = CartItem.all
  end

  def show
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(cart_item_params)
    redirect_to @cart_item.cart
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_cart_item
  end

  def set_cart
  end

  def cart_item_params
  end
end
