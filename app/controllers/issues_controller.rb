class IssuesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    if @issue.save
      redirect_to @issue, notice: 'Задача добавлена'
    else
      render :new
    end
  end

  def show; end

  private

  def resource_params
    params.require(:issue).permit(:description)
  end
end
