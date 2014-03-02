class InvestorsController < ApplicationController

  respond_to :html

  def show
    find_investor
    tally_links
    respond_with @investor
  end

  def request_buspreneurship
    current_omniauthable.type = 'Buspreneur'
    current_omniauthable.save
    redirect_to root_path
  end

  private

  def find_investor
    @investor = Investor.find(params[:id])
  end

  def tally_links
    Bitly.use_api_version_3
    bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
    @total_clicks = 0
    @click_count = {}
    links = @investor.investments.map(&:url).uniq

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
