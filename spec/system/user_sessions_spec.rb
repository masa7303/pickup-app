require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do

  describe 'ユーザーのログイン挙動テスト' do
    let(:user) {create(:user)}

    describe 'ログイン前のケース' do

      # 正常な場合
      context 'フォーム入力値が全て正しいとき' do
        it 'ログインが成功する' do
          visit login_path
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード', with: 'password'
          click_button('ログインする')
          expect(root_path).to eq(current_path)
          expect(page).to have_content 'ログインしました'
        end
      end

      # 異常な場合
      context 'フォームが未入力のとき' do
        it 'ログインが失敗する' do
          user
          visit login_path
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          click_button('ログインする')
          expect(login_path).to eq current_path
          expect(page).to have_content 'ログインに失敗しました'
        end
      end
    end

    describe 'ログイン後のケース' do
      # 正常な場合
      context 'ログアウトボタンをクリックしたとき' do
        it 'ログアウトに成功する' do
          login(user)
          click_link user.name
          click_link('ログアウト')
          expect(root_path).to eq(current_path)
          expect(page).to have_content 'ログアウトしました'
        end
      end
    end
  end
end
