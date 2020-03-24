class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = current_user.tasks.find(params[:id])

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
    redirect_to tasks_url, notice: "業務スレッド「#{task.name}」を更新しました。"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "業務スレッド「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
