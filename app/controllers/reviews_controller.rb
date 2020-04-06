class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]
  before_action :login_required, except: [:index]
  before_action :recent_review, only: %i[show edit]
  before_action :guest_edit, only: %i[edit destroy]

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).recent.includes([:user, :review_image_attachment])
  end

  def edit
    @review = Review.find(params[:id])
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
    @review = Review.new(review_params)
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
    params.require(:review).permit(:title, :body, :review_image, :rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

  def review_update_params
    params.require(:review).permit(:title, :body, :review_image, :rate)
  end

  def search_params
    params[:q]&.permit(:title, :body, :rate)
  end

  def recent_review
    @recent_reviews = Review.recent.includes([:shop]).limit(5)
  end
end
