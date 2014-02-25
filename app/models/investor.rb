class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments

  def request_buspreneurship
    self.type = "Buspreneur"
    self.save
  end
end
