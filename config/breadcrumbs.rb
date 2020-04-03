crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", dashboard_index_path
end

crumb :email_change do
  link "メールアドレスの変更", mypage_email_path(current_user)
  parent :mypage
end

crumb :password_change do
  link "パスワードの変更", mypage_password_path(current_user)
  parent :mypage
end

crumb :myreview do
  link "レビュー", mypage_reviews_path(current_user)
  parent :mypage
end

crumb :user do
  link "ユーザー一覧", admin_users_path
end

crumb :show_user do
  link "ユーザーの詳細", admin_user_path
  parent :user
end

crumb :shop do
  link "オススメのお店", shops_path
end

crumb :new_shop do
  link "お店を登録", new_shop_path
  parent :shop
end

crumb :review do
  link "レビュー", review_path
  parent :shop
end

crumb :task do
  link "業務スレッド", tasks_path
end

crumb :new_task do
  link "業務スレッドを登録", new_task_path
end

crumb :contact do
  link "問い合わせ", inquiry_path
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
