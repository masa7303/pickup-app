require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  let(:user) {create(:user)}
  let(:task) {create(:task, user: user)}


  describe '業務スレッドの閲覧テスト' do

    context '業務スレッドの一覧画面' do
      it 'スレッドが表示される' do
        task
        login(user)
        visit tasks_path
        expect(page).to have_content '確定申告について'
      end
    end

    context '業務スレッドの詳細画面' do
      it 'スレッドが表示される' do
        login(user)
        visit task_path(task)
        expect(page).to have_content '確定申告について'
      end
    end

  end

  describe '業務スレッドの新規投稿テスト' do

      context 'フォームの入力値が全て正しいとき' do
        it 'スレッドの投稿に成功する' do
          login(user)
          visit tasks_path
          select '人事', from: '担当部署'
          fill_in 'task[name]', with: 'テストタイトル'
          fill_in 'task[description]', with: 'テストコンテンツ'
          click_button '登録する'
          expect(page).to have_content '業務スレッド「テストタイトル」を登録しました。'
          expect(Task.count).to eq 1
        end
      end

  end

  describe '業務スレッドの編集テスト' do

      context '業務スレッドの入力が全て正しいとき' do
        it 'スレッドの編集に成功する' do
          login(task.user)
          visit edit_task_path(task)
          fill_in 'task[name]', with: '編集後タイトル'
          fill_in 'task[description]', with: '編集後コンテンツ'
          click_button '更新する'
          expect(page).to have_content '業務スレッド「編集後タイトル」を更新しました。'
          expect(Task.count).to eq 1
        end
      end

  end

  describe '業務スレッドの削除テスト' do

    it 'スレッドを削除できること' do
      login(task.user)
      visit mypage_threads_path
      click_link '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content '業務スレッド「確定申告について」を削除しました'
      expect(current_path).to eq mypage_threads_path
      expect(Task.count).to eq 0
    end

  end

end
