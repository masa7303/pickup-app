class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to login_path
      flash[:alert] = 'ログインに失敗しました'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
