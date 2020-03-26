class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to request.referer, notice: "フォローしました"
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to request.referer, notice: "フォローに失敗しました"
    end
  end

  def destroy
    user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to request.referer, notice: "フォローを解除しました"
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to request.referer, notice: "フォロー解除に失敗しました"
    end
  end
end
