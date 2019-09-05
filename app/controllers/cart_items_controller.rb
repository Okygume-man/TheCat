class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart_item, only: [ :show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create] 

  def index
    @cart_items = CartItem.all
  end

  def show
    @cart_items = CartItem.all
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    item = Item.find(params[:item_id])
    @cart_item_params = @cart.add_item(item)
    @cart_item = @cart.create_or_select_Cart_Item(@cart_item_params)
    redirect_to cart_path(@cart)
  end

  def edit
  end

  def update
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :cart_id)
  end


end
