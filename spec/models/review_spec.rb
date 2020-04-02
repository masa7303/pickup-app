require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'バリデーションのテスト' do

    describe 'レビューの新規登録にかかるバリデーションのテスト' do

      context "ファクトリが有効なとき" do
        # 有効なファクトリを持つ
        it "エラーなし" do
          create(:user)
          create(:shop)
          expect(build(:review)).to be_valid
        end
      end

      context "各カラムが不足しているとき" do
        # タイトルがなければ無効
        it { is_expected.to validate_presence_of(:title) }
        # 内容がなければ無効
        it { is_expected.to validate_presence_of(:body) }
        # 評価がなければ無効
        it { is_expected.to validate_presence_of(:rate) }
      end

      context "関連をもつとき" do
        it { should belong_to(:user)}
        it { should belong_to(:shop)}
      end

    end

  end
end
