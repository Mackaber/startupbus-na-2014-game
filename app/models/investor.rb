class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments
  has_many :investor_team_updates
  has_many :team_updates, through: :investor_team_updates
  validates :bank, numericality: { greater_than_or_equal_to: 0 }

  def total_invested
    tot ||= investments.pluck(:amount).reduce(:+) || 1
  end

  def teams_invested
    investments.map(&:team).uniq.map(&:name).to_sentence
  end

  def remove_funds(funds)
    self.bank -= funds.to_i
  end

  def add_funds(funds)
    self.bank += funds.to_i
  end

  def get_points
    total_points = 0
    total_clicks = 0
    investments.each do |investment|
      total_clicks += investment.clicks 
    end
    teams.each do |team|
      total_points += team.total_points
    end
    if total_points == 0
      total_points = 1
    end
    max_funds = Investment.all.pluck(:amount).reduce(:+)
    if max_funds == 0
      max_funds = 1
    end
    total_points *= total_points.to_f * (total_invested.to_f/max_funds.to_f)
    total_points += total_clicks.to_f * 0.5
    total_points.floor
  end
end
