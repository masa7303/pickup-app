require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
  end

  describe '業務スレッドの新規登録にかかるバリデーションのテスト' do

    # 正常な場合
    context 'Userのfactory_botが有効か' do
      it "エラーなし" do
        user = @user
        expect(user).to be_valid
      end
    end

    context 'section、name、description、user_idがあるとき' do
      it "エラーなし" do
        task = @task
        expect(task).to be_valid
      end
    end

    # 異常な場合
    context 'スレッドの名前がないとき' do
      it "エラーあり" do
        task = Task.new(name: nil)
        task.valid?
        expect(task.errors[:name]).to include("を入力してください")
      end
    end

    context 'スレッドの内容がないとき' do
      it "エラーあり" do
        task = Task.new(description: nil)
        task.valid?
        expect(task.errors[:description]).to include("を入力してください")
      end
    end
  end
end
