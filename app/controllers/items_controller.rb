class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order("created_at desc")
  end

  def show
      @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to @item
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :user_id)
  end
end
