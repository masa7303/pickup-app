require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do

    describe 'ユーザーの新規登録のバリデーションのテスト' do

      # 正常な場合
      context '有効なファクトリを持つとき' do
        it 'エラーなし' do
          expect(build(:user)).to be_valid
        end
      end

      # 異常な場合
      context '名前がないとき' do
        it 'エラーあり' do
          user = User.new(name: nil)
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:name]).to include('を入力してください')
        end
      end

      context 'メールアドレスがないとき' do
        it 'エラーあり' do
          user = User.new(email: nil)
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:email]).to include('を入力してください')
        end
      end

      context 'メールアドレスが重複しているとき' do
        it 'エラーあり' do
          user = create(:user)
          duplicated_user = build(:user, email: user.email)
          expect(duplicated_user.valid?).to eq(false)
          expect(duplicated_user.errors.messages[:email]).to include('はすでに存在します')
        end
      end

      context 'パスワードがないとき' do
        it 'エラーあり' do
          user = build(:user, password: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:password]).to include('を入力してください')
        end
      end

      context 'パスワードが一致しない場合' do
        it 'エラーあり' do
          user = build(:user, password: 'password',password_confirmation: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:password_confirmation]).to include('とパスワードの入力が一致しません')
        end
      end

      context '都道府県がないとき' do
        it 'エラーあり' do
          user = User.new(prefecture: nil)
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:name]).to include('を入力してください')
        end
      end
    end
  end
end
