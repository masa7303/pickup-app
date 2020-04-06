class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :guest_edit

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def guest_edit
    @user = User.find(current_user.id)
    return unless @user.guest?
    redirect_to dashboard_index_path, notice: '申し訳ございませんが、ゲストユーザーは編集できません'
  end
end
