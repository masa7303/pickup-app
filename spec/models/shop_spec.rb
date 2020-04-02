require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user: @user)
  end

  describe 'バリデーションのテスト' do

    describe '店舗の新規登録にかかるバリデーションのテスト' do

      # 正常な場合
      context 'バリデーションが全て正しいとき' do
        it 'エラーなし' do
          shop = @shop
          expect(shop).to be_valid
        end
      end

      # 異常な場合
      context '店の名前がないとき' do
        it "エラーあり" do
          shop = Shop.new(name: nil)
          expect(shop.valid?).to eq(false)
          expect(shop.errors[:name]).to include("を入力してください")
        end
      end

    end
  end
end
