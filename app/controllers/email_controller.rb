class EmailController < ApplicationController
  before_action :login_required

  def update
    default_params = email_params
    if current_user.update(default_params)
      redirect_to mypage_email_url, notice: 'メールアドレスが変更されました'
    else
      redirect_to mypage_email_url, alert: 'ユーザー情報の編集に失敗しました'
    end
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end
end
