class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
  end

  def index
    @teams = Team.all.sort
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_omniauthable.team = @team
      current_omniauthable.save
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
    params.require(:team).permit :description,
      :name, :website, :twitter_handle, :facebook_url, :github_url, :bus_id
  end

end
