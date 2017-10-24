class IssuesController < ApplicationController
  before_action :find_by_token, only: :show
  load_and_authorize_resource except: %i[find]

  def index
    %i[status building_id].each do |filter|
      @issues = @issues.where(filter => params[filter]) if params[filter]
    end

    if params[:tag_id]
      @issues = @issues.joins(:features).where(features: { tag_id: params[:tag_id] })
    end

    if params[:search]
      keywords = params[:search].split
      query = (1..keywords.size).map { "description LIKE ?" }.join(' OR ')
      @issues = @issues.where(query, keywords.map { |k| "%#{k}%" })
    end

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
    unless @found_by_token
      raise ActiveRecord::RecordNotFound unless can?(:update, @issue)
    end

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
    @not_closed_issues = @issues.where(status: %i[accepted reviewed in_work])
    @issues_by_building = @not_closed_issues.group_by(&:building)
  end

  def history; end

  private

  def find_by_token
    @issue = Issue.find_by_token(params[:id])
    unless @issue.blank?
      @found_by_token = true
      return
    end
    # return unless @issue.blank?

    raise ActiveRecord::RecordNotFound unless can?(:update, Issue)
    @issue = Issue.find(params[:id])
  end

  def resource_params
    params.require(:issue).permit(:description, :building_id, :phone, :room, :status,
                                  tag_ids: [])
  end
end
