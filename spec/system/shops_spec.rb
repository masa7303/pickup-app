require 'rails_helper'

RSpec.describe 'Shops', type: :system do

  describe '店舗情報のテスト' do
    let(:user) {create(:user)}
    let(:shop) {create(:shop, user: user)}

    describe '店舗情報の一覧画面' do
      it '店舗情報が表示される' do
        shop.image.attach(io: File.open("#{Rails.root}/db/fixtures/images/ramen-01.jpg"), filename: 'ramen-01.jpg')
        login(user)
        visit shops_path
        expect(page).to have_content 'ラーメン大王'
      end
    end

    describe '店舗情報の詳細画面' do
      it '店舗情報が表示される' do
        login(user)
        shop.image.attach(io: File.open("#{Rails.root}/db/fixtures/images/ramen-01.jpg"), filename: 'ramen-01.jpg')
        visit shop_path(shop)
        expect(page).to have_content 'ラーメン大王'
      end
    end
  end
end
