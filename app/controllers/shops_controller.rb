class ShopsController < ApplicationController
  before_action :login_required, except: :new
  before_action :recent_review
  before_action :guest_edit, only: %i[create edit]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).with_attached_image.page(params[:page]).per(6)
    @reviews = Review.recent.includes([:shop]).limit(5)
  end

  def show
    @shop = Shop.find(params[:id])

    @reviews = Review.where(shop_id: params[:id]).includes([:user, :review_image_attachment])
    @review = Review.new
  end

  def new
    @reviews = Review.recent.includes([:shop]).limit(5)
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params.merge(user_id: current_user.id))

    if @shop.save
      redirect_to @shop, notice: "「#{@shop.name}」を登録しました"
    else
      # redirect_to new_shop_path, flash: { error: @shop.errors.full_messages }
      render :new
    end
  end

  def search
    @q = Shop.search(search_params)
    @shops = @q.result(distinct: true).with_attached_image.page(params[:page])
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :prefecture, :address, :phone, :image)
  end

  def search_params
    params.require(:q).permit!
  end

  def recent_review
    @recent_reviews = Review.recent.includes([:shop]).limit(5)
  end
end
