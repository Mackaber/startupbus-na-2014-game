class LeaderboardController < ApplicationController

  def index
  	@teams = Team.all.sort_by { |team| total_milestone_points(team.id) }.reverse
  end

  def total_milestone_points(team_id)
  	@total_points = 0
  	@milestone_team = MilestoneTeam.where(:team_id => team_id)
  	@total_points += @milestone_team.each do |point|
  		@total_points += point.milestone.max_points
  	end
  	@total_points
  end

  helper_method :total_milestone_points

end