class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments

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
end
