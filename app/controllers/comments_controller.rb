class CommentsController < ApplicationController
  before_action :set_post, except: [:index, :destroy]

  def index
    @comments = Task.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, task_id: params[:task_id]))

    if @comment.save
      redirect_to @task, notice: "コメントを登録しました"
    else
      render :new
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to mypage_comments_path(current_user), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @task = Task.find(params[:task_id])
  end
end
