class IssuesController < ApplicationController
  before_action :find_by_token, only: :show
  load_and_authorize_resource except: :find

  def index
    @issues = @issues.where(status: params[:status]) if params[:status]
    @issues = IssuesDecorator.decorate(@issues)
  end

  def new; end

  def create
    if @issue.save
      redirect_to issue_path(id: @issue.token), notice: 'Задача добавлена'
    else
      render :new
    end
  end

  def find; end

  def show; end

  private

  def find_by_token
    @issue = Issue.find_by_token(params[:id])
    return unless @issue.blank?

    raise ActiveRecord::RecordNotFound unless can?(:manage, Issue)
    @issue = Issue.find(params[:id])
  end

  def resource_params
    params.require(:issue).permit(:description, :hostel_id, :room)
  end
end
