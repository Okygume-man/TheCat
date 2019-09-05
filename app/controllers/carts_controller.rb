class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = Cart.all
  end

  def show
  end

  def new
  end

  def create
    @cart = Cart.create(cart_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "L'accès au panier #{params[:id]} est invalide"
    redirect_to root_path, notice: "Ce pannier n'existe pas"
  end

end
