require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do

    describe 'ユーザーの新規登録のバリデーションのテスト' do

      # 正しい時
      context 'バリデーションが全て正しいとき' do
        it 'エラーにならない' do
          user = build(:user)
          expect(user).to be_valid
        end
      end

      # 異常系
      context '名前が空のとき' do
        it 'エラーになる' do
          user = build(:user, name: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:name]).to include('を入力してください')
        end
      end

      context 'メールアドレスが空のとき' do
        it 'エラーになる' do
          user = build(:user, email: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:email]).to include('を入力してください')
        end
      end

      context 'メールアドレスが重複しているとき' do
        it 'エラーになる' do
          user = create(:user)
          duplicated_user = build(:user, email: user.email)
          expect(duplicated_user.valid?).to eq(false)
          expect(duplicated_user.errors.messages[:email]).to include('はすでに存在します')
        end
      end

      context 'パスワードが空のとき' do
        it 'エラーになる' do
          user = build(:user, password: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:password]).to include('は6文字以上で入力してください')
        end
      end

      context 'パスワードが6文字以下の場合' do
        it 'エラーになる' do
          user = build(:user, password: 'passw')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:password]).to include('は6文字以上で入力してください')
        end
      end

      context 'パスワードが一致しない場合' do
        it 'エラーになる' do
          user = build(:user, password: 'password',password_confirmation: '')
          expect(user.valid?).to eq(false)
          expect(user.errors.messages[:password_confirmation]).to include('とパスワードの入力が一致しません', 'を入力してください')
        end
      end
    end
  end
end
