class ReviewsController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).with_attached_image
  end

  def edit
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
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to shop_path(params[:shop_id]), success: '口コミ投稿が完了しました'
    else
      @shop = Shop.find(params[:shop_id])
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
    params.require(:review).permit(:title, :body, :review_image, :rate).merge(shop_id: params[:shop_id])
  end

  def review_update_params
    params.require(:review).permit(:title, :body, :review_image)
  end

  def search_params
    params[:q]&.permit(:title, :body)
  end
end
