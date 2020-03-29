class ShopsController < ApplicationController
  before_action :login_required, except: :new

  def index
    @shops = Shop.with_attached_image.page(params[:page]).per(6)
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params.merge(user_id: current_user.id))

    if @shop.save
      redirect_to @shop, notice: "業務スレッド「#{@shop.name}」を登録しました"
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :phone, :image)
  end

end
