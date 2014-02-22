class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render action: "new"
    end
  end

  def request_to_join
    redirect_to @team, notice: 'Team was successfully created.'
  end

  private

  def team_params
    params.require(:team).permit(:description, 
    :name, :website, :twitter_handle, :facebook_url, :github_url, :bus_id)
  end

end