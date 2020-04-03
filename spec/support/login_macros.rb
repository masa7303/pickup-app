module LoginMacros
  def login(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'protein'
    click_button 'ログイン'
  end
end
