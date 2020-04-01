class TasksController < ApplicationController
  before_action :login_required

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)

    if params[:tag_name]
      @tasks = Task.tagged_with("#{params[:tag_name]}")
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
      redirect_to @task, notice: "業務スレッド「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to mypage_dashboad_path, notice: "メールアドレスを更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "業務スレッド「#{task.name}」を削除しました。"
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
end
