class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments
  has_many :investor_team_updates
  has_many :team_updates, through: :investor_team_updates
  validates :bank, numericality: { greater_than_or_equal_to: 0 }

  def request_buspreneurship
    self.type = "Buspreneur"
    self.save
  end

  def total_invested
    investments.pluck(:amount).reduce(:+)
  end

  def teams_invested
    investments.map(&:team).uniq.map(&:name).to_sentence
  end

  def remove_funds(funds)
    self.bank -= Float(funds)
  end

  def add_funds(funds)
    self.bank += Float(funds)
  end

  def get_points
    total_points = 0
    team_investments = []
    investments.each do | investment |
      team_investments[investment.team_id] += investment.amount
    end
    teams.each do | team |
      total_points += team.milestone_points * (team_investments[team.id] / team.funding)
    end
    total_points
  end
end
