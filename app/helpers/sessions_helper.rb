module SessionsHelper
  def logged_in?                                                    # ログイン中？
    !current_user.nil?                                              # current_userメソッド利用
  end
end
