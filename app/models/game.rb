class Game < ActiveRecord::Base
  has_many :investments, through: :investor_games
  has_many :investors, through: :investor_games

  def investor_score(investor)
    current_score = [0]
    if investor && investor.investments.any?
      investor.investments.each do |investment|
        current_score << milestone_points(investment)
        current_score << investment.team.funding
      end
    end
    current_score.inject(:+)
  end

  def milestone_points(investment)
    investment.team.milestone_teams.map(&:awarded_points).inject(:+)
  end
end