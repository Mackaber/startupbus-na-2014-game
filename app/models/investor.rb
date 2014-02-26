class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments

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
end
