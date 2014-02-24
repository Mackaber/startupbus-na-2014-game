class Investor < Omniauthable
  has_many :investments
  has_many :teams, through: :investments
end
