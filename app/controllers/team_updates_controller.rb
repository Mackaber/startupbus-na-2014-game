class TeamUpdatesController < ApplicationController

  def new
    @team_update = TeamUpdate.new
    @team = current_omniauthable.team
  end

  def create
    @team_update = TeamUpdate.new(params[:team_update])
    @team_update.team = current_omniauthable.team
    if @team_update.save
      redirect_to @team_update.team, notice: 'Team Update submitted.'
    else
      render action: "new"
    end
  end

end
