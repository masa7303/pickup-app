class MypageController < ApplicationController
  def reviews
    @my_reviews = current_user.reviews.includes([:review_image_attachment]).page(params[:page]).order(created_at: :desc)
  end

  def shops
    @favorite_shops = current_user.likes.includes(:shop).page(params[:page]).order(created_at: :desc)
  end

  def threads
    @my_threads = current_user.tasks.page(params[:page]).order(created_at: :desc)
  end

  def comments
    @my_comments = current_user.comments.includes([:task]).page(params[:page]).order(created_at: :desc)
  end

  def profile; end

  def email; end

  def password; end
end
