require 'rails_helper'

RSpec.describe 'Likes', type: :system do

  describe 'いいね！のテスト' do
    let(:user) {create(:user)}
    let(:shop) {create(:shop, user: user)}
    let(:like) {create(:like)}

    context 'ログインしているとき' do

      it '店舗にいいね！ができること' do
        login(user)
        visit shop_path(shop)
        click_button 'いいね！'
        expect(page).to have_content 'いいね！を外す'
        expect(Like.count).to eq 1
      end

      it 'いいね！が詳細画面でも反映されていること' do
        login(like.user)
        visit shop_path(like.shop)
        expect(page).to have_content 'いいね！を外す'
        expect(page).to have_content 'ラーメン大王'
        expect(Like.count).to eq 1
      end

      it '店舗のいいね！を消せること' do
        login(like.user)
        visit shop_path(like.shop)
        click_button 'いいね！を外す'
        expect(page).to have_content 'いいね！'
        expect(Like.count).to eq 0
      end

      it 'マイページにいいね！した店舗が表示される' do
        login(like.user)
        visit mypage_shops_path
        expect(page).to have_content 'ラーメン大王'
      end
    end

    # context 'ログインしていないとき' do
    #   it 'いいね！ができずにログイン画面へリダイレクトされる' do
    #     shop
    #     visit shop_path(like.shop)
    #     click_button 'いいね！'
    #     expect(page).to have_content 'ログインしてください'
    #     expect(current_path).to eq login_path
    #   end
    # end
  end
end
