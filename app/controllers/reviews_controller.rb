class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]
  before_action :login_required, except: [:index]

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).with_attached_review_image
  end

  def edit
  end

  def show
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_update_params)
      redirect_to shop_path(@review.shop), success: '口コミを更新しました'
    else
      flash.now[:danger] = '口コミを編集できませんでした'
      render :edit
    end
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params.merge(user_id: current_user.id, shop_id: params[:shop_id]))
    if @review.save
      redirect_to shop_path(params[:shop_id]), success: '口コミ投稿が完了しました'
    else
      redirect_to shop_path(@shop), danger: '口コミ投稿が失敗しました'
    end
  end

  def destroy
    @shop = Shop.find(@review.shop_id)
    @review.destroy!
    redirect_to shop_path(@shop), success: '口コミを削除しました'
  end

  private

  def set_review
    @review = current_user.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :rate)
  end

  def review_update_params
    params.require(:review).permit(:title, :body, :review_image, :rate)
  end

  def search_params
    params[:q]&.permit(:title, :body, :rate)
  end
end
