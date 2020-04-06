class TasksController < ApplicationController
  include Common

  before_action :login_required
  before_action :tag_cloud, only: %i[index edit new search]
  before_action :guest_edit, only: %i[edit]

  def index
    @q = Task.ransack(params[:q])
    @task = Task.new
    @tasks = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(10)

    #タグ絞り込み
    if params[:tag_name]
      # 簡単な書き方検討必要
      @tasks = Task.tagged_with("#{params[:tag_name]}").ransack(params[:q]).result(distinct: true).page(params[:page]).per(10)
    end
  end

  def show
    @task = Task.find(params[:id])

    # 口コミ表示
    @comments = Comment.where(task_id: params[:id])
    @comment = Comment.new
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))

    if @task.save
      redirect_to @task, notice: "業務スレッド「#{@task.name}」を登録しました。"
    else
      # redirect_to tasks_path, alert: '業務スレッドの登録に失敗しました'
      render :new
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to mypage_threads_path, notice: "業務スレッド「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to mypage_threads_path, notice: "業務スレッド「#{task.name}」を削除しました。"
  end

  def search
    @q = Task.search(search_params)
    @tasks = @q.result(distinct: true)
  end

  private

  def task_params
    params.require(:task).permit(:section, :name, :description, :tag_list)
  end

  def search_params
    params.require(:q).permit!
  end

  def tag_cloud
    @tags = tags_desc
  end
end
