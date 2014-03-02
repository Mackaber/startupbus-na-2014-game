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
    teams.each do |team|
      total_points += team.total_points
    end
    max_funds ||= Investment.all.pluck(:amount).reduce(:+) || 1
    if max_funds == 0
      max_funds = 1
    end
    total_points *= (total_invested / max_funds) * 0.37
    total_points
  end
end
