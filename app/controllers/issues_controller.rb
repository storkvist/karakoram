class IssuesController < ApplicationController
  before_action :find_by_token, only: :show
  load_and_authorize_resource except: %i[find]

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

  def show
    @issue = @issue.decorate
  end

  def edit; end

  def update
    if @issue.update_attributes(resource_params)
      redirect_to issue_path(id: @issue.token), notice: 'Задача изменена'
    else
      render :edit
    end
  end

  def stats
    # issuesByStatus
    @accepted_count = @issues.accepted.count
    @reviewed_count = @issues.reviewed.count
    @in_work_count = @issues.in_work.count
    @closed_count = @issues.closed.count

    # notClosedIssuesByDate
    @not_closed_issues = @issues.where(status: [:accepted, :reviewed, :in_work])
    @issuesByBuilding = @not_closed_issues.group_by(&:building)
  end

  private

  def find_by_token
    @issue = Issue.find_by_token(params[:id])
    return unless @issue.blank?

    raise ActiveRecord::RecordNotFound unless can?(:manage, Issue)
    @issue = Issue.find(params[:id])
  end

  def resource_params
    params.require(:issue).permit(:description, :building_id, :phone, :room,
                                  tag_ids: [])
  end
end
