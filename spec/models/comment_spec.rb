require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) {create(:user)}
    let(:task) {create(:task)}
    let(:comment) {create(:comment)}

    describe 'コメントの新規登録にかかるバリデーションのテスト' do

      # 正常な場合
      context 'ファクトリが有効なとき' do
        it 'エラーなし' do
          expect(build(:comment)).to be_valid
        end
      end

      # 異常な場合
      context '内容がないとき' do
        it "エラーあり" do
          comment = Comment.new(body: nil)
          expect(comment.valid?).to eq(false)
          expect(comment.errors[:body]).to include("を入力してください")
        end
      end

      # context 'アソシエーションの検証' do
      #   it 'スレッドが削除されると、コメントも削除される' do
      #     expect {comment}.to change {Comment.count}.by(+1)
      #     comment.task.destroy
      #     expect(Task.count).to eq 0
      #     expect(Comment.count).to eq 0
      #   end
      #
      #   it 'ユーザーが削除されると、コメントも削除される' do
      #     expect {comment}.to change {Comment.count}.by(+1)
      #     comment.user.destroy
      #     expect(User.count).to eq 1
      #     expect(Comment.count).to eq 0
      #   end
      # end

    end
  end
end
