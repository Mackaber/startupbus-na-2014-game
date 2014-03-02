class LeaderboardController < ApplicationController

  def index
  	@investors = Investor.all.sort_by { |investor| investor.get_points }.reverse
  end

end