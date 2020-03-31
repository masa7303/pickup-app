class MypagesController < ApplicationController
  def reviews
    @my_reviews = current_user.reviews.page(params[:page]).order(created_at: :desc)
  end

  def shops
    @favorite_shops = current_user.likes.includes(:shop).page(params[:page]).order(created_at: :desc)
  end

  def profile; end

  def email; end

  def password; end
end
