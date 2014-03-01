class InvestorsController < ApplicationController

  respond_to :html

  def show
    find_investor
    tally_links
    respond_with @investor
  end

  def request_buspreneurship
    @investor = Investor.find(params[:investor_id])
    @investor.request_buspreneurship
    redirect_to Buspreneur.find(@investor.id)
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
    @investor.investments.each do |investment|
      if investment.url?
        bit = bitly_client.clicks(investment.url)
          @total_clicks = @total_clicks + bit.user_clicks
          @click_count[investment.url] = bit.user_clicks
      end
    end
  end
end
