class Conductor < Omniauthable
  belongs_to :bus

  has_many :messages

  delegate :name, :team_names, to: :bus, prefix: true, allow_nil: true

  scope :approved, -> { where.not(approved_at: nil) }

  def self.knows_about?(email)
    AccountChecker.knows_about?(email, checker_type)
  end

  def self.checker_type
    AccountChecker::Type::CONDUCTORS
  end

  def approve!(approved_by = nil)
    self.approved_by = approved_by
    touch :approved_at
  end

  def admin?
    true
  end

  def to_s
    name
  end
end
