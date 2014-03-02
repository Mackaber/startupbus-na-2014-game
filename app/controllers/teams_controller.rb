require "net/http"

class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    if @team.short_url.present?
      Bitly.use_api_version_3
      bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
      bit = bitly_client.clicks(@team.short_url)
      @team.clicks = bit.global_clicks
      @team.save
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    if !@team.short_url.present?
      if url_exist?(@team.website)
        Bitly.use_api_version_3
        bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
        bit = bitly_client.shorten("#{@team.website}?utm_source=game&utm_medium=link&utm_campaign=TEAM")
        @team.short_url = bit.short_url
      end
    end
    @team.save
    redirect_to team_path @team
  end

  def index
    if current_omniauthable.is_a?(Investor)
      @teams = Team.where.not(id: current_omniauthable.investments.collect(&:team_id).uniq).sort_by { |team| team.total_points }.reverse
    else
      @teams = Team.all.sort_by { |team| team.total_points }.reverse
    end

 
    if current_omniauthable.is_a?(Investor)
      @investor = current_omniauthable

      tally_links
    end
  end

  def create
    @team = Team.new(team_params)
    if url_exist?(@team.website)
      Bitly.use_api_version_3
      bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
      bit = bitly_client.shorten("#{@team.website}?utm_source=game&utm_medium=link&utm_campaign=TEAM")
      @team.short_url = bit.short_url
    end
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

  def url_exist?(url_string)
    if url_string.nil? || url_string.blank?
      false
    end
    url = URI.parse(URI.encode(url_string.strip))
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    req.request_head(path || '/')
    if res.kind_of?(Net::HTTPRedirection)
      url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL 
    else
      ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
    end
  rescue Errno::ENOENT
    false #false if can't find the server
  end

  def tally_links
    Bitly.use_api_version_3
    bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
    @total_clicks = 0
    @click_count = {}
    links = @investor.investments.collect(&:url).uniq
    links.each do |link|
      bit = bitly_client.clicks(link)
      investment = Investment.find_by_url(link)
      investment.clicks = bit.user_clicks
      investment.save
      @total_clicks = @total_clicks + bit.user_clicks
      @click_count[link] = bit.user_clicks
    end
  end
end
