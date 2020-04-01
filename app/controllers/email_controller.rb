class EmailController < ApplicationController
  before_action :login_required

  def update
    default_params = email_params
    return redirect_to mypages_email_path, flash: { danger: '確認用メールアドレスと一致しません' } unless tmp_params[:email] == default_params.delete(:email_confirmation)
    flash[:success] = 'メールアドレスを変更しました' if current_user.update(default_params)
    redirect_to dashboard_index_path
  end

  private

  def email_params
    params.require(:user).permit(:email, :email_confirmation)
  end
end
