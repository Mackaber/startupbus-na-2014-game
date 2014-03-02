class LeaderboardController < ApplicationController

  def index
  	@teams = Team.all.sort_by { |team| team.milestone_points }.reverse
  end

end