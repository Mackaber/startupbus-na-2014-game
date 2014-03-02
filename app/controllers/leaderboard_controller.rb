class LeaderboardController < ApplicationController

  def index
  	@investors = Investor.all.sort_by { |investor| investor.get_points }.reverse
  end

  def iframe
    @investors = Investor.all.sort_by { |investor| investor.get_points }.reverse
    render :iframe, :layout => false
  end
end