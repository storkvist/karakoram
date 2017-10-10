class CommentsController < ApplicationController
  load_and_authorize_resource :issue
  load_and_authorize_resource :comment, through: :issue

  def create
    if @comment.save
      redirect_to @comment.issue, notice: 'Комментарий добавлен'
    else
      redirect_to :back
    end
  end

  private

  def resource_params
    params.require(:comment).permit(:issue_id, :public, :text, :user_id)
  end
end
