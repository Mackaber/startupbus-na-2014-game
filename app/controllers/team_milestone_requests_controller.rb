class TeamMilestoneRequestsController < ApplicationController

  def new
    @team_milestone_request = TeamMilestoneRequest.new
    @team = current_omniauthable.team
  end

  def edit
  end

  def create
    @team_milestone_request = TeamMilestoneRequest.new
    puts params.inspect
    @team_milestone_request.team = current_omniauthable.team
    @team_milestone_request.milestone_id = params[:milestone_id]
    @team_milestone_request.description = params['team_milestone_request'][:description]
    @team_milestone_request.url = params['team_milestone_request'][:url]
    if @team_milestone_request.save
      redirect_to @team_milestone_request.team, notice: 'Milestone request submitted for approval.'
    else
      render action: "new"
    end
  end

end
