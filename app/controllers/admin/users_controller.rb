class Admin::UsersController < ApplicationController
  # before_action :require_admin

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: params[:id])

    @user_followings = @user.followings.with_attached_image.page(params[:page]).per(6)
    @user_followers = @user.followers.with_attached_image.page(params[:page]).per(6)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  def search
    require 'jp_prefecture'
    @q = User.search(search_params)
    @users = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :prefecture, :municipality, :password, :password_confirmation, :image)
  end

  def search_params
    params.require(:q).permit!
  end

  # def require_admin
  #   redirect_to root_path unless current_user.admin?
  # end

end
