class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    if current_omniauthable.is_a?(Buspreneur) and current_omniauthable.team == @team
      Bitly.use_api_version_3
      bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
      bit = bitly_client.clicks(@team.short_url)
      @team.clicks = bit.user_clicks
      @team.save
    end
  end

  def edit
  end

  def index
    @teams = Team.all.sort
  end

  def create
    @team = Team.new(team_params)
    Bitly.use_api_version_3
    bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
    bit = bitly_client.shorten("#{@team.website}?utm_source=game&utm_medium=link&utm_campaign=TEAM")
    @team.short_url = bit.short_url
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
