require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'いいね！のテスト' do
    let(:user) {create(:user)}
    let(:shop) {create(:shop)}
    let(:like) {create(:like)}

    describe 'ライク（いいね！）の新規登録にかかるバリデーションのテスト' do

      # context "ファクトリが有効なとき" do
      #   # 有効なファクトリを持つ
      #   it "エラーなし" do
      #     create(:user)
      #     create(:shop)
      #     expect(build(:like)).to be_valid
      #   end
      # end
      #
      # context "各カラムが不足しているとき" do
      #   # ユーザーIDがなければ無効
      #   it { is_expected.to validate_presence_of(:user_id) }
      #   # 店舗のIDがなければ無効
      #   it { is_expected.to validate_presence_of(:shop_id) }
      # end
      #
      # context "関連をもつとき" do
      #   it { should belong_to(:user)}
      #   it { should belong_to(:shop)}
      # end

      # 正常な場合
      context 'バリデーションがすべて正しいとき' do
        it 'いいね！できる' do
          like = create(:like)
          expect(like).to be_valid
        end

        it 'いいね！が外せる' do
          like
          expect {like.destroy}.to change {Like.count}.by(-1)
        end
      end

      context '既にいいね！されているとき' do
        it 'エラーあり' do
          like
          other_like = build(:like, user_id: like.user_id, shop_id: like.shop_id)
          expect(other_like.valid?).to eq(false)
          expect(other_like.errors.messages[:user_id]).to include('はすでに存在します')
        end
      end

      context 'アソシエーションの検証' do
        it 'ショップが削除されると、いいね！も削除される' do
          expect {like}.to change {Like.count}.by(+1)
          like.shop.destroy
          expect(Shop.count).to eq 0
          expect(Like.count).to eq 0
        end

        it 'ユーザーが削除されると、いいね！も削除される' do
          expect {like}.to change {Like.count}.by(+1)
          like.user.destroy
          expect(User.count).to eq 0
          expect(Like.count).to eq 0
        end
    end

    end

  end
end
