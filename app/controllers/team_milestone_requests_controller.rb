class TeamMilestoneRequestsController < ApplicationController

  def new
    @team_milestone_request = TeamMilestoneRequest.new
    @team = current_omniauthable.team
  end

  def edit
  end

  def create
    @team_milestone_request = TeamMilestoneRequest.new(params[:team_milestone_request])
    @team_milestone_request.team = current_omniauthable.team
    if @team_milestone_request.save
      redirect_to @team_milestone_request.team, notice: 'Milestone request submitted for approval.'
    else
      render action: "new"
    end
  end

end
