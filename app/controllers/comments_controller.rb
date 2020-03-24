class CommentsController < ApplicationController
  before_action :set_post, except: [:index]

  def index
    @comments = Task.comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = current_user.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    redirect_to @task
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @task = Task.find(params[:task_id])
  end
end
