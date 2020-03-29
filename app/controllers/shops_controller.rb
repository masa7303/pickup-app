class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :phone)
  end

end
