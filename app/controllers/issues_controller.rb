class IssuesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    if @issue.save
      redirect_to @issue
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:issue).permit(:description)
  end
end
