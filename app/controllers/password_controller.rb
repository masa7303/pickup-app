class PasswordController < ApplicationController
  before_action :login_required
  before_action :guest_edit

  def update
    default_params = password_params
    if current_user.update(default_params)
      redirect_to mypage_password_url, notice: 'パスワードが変更されました'
    else
      redirect_to mypage_password_url, alert: 'パスワードの変更に失敗しました'
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
