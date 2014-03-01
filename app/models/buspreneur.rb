class Buspreneur < Omniauthable
  belongs_to :team
  delegate :name, to: :team, prefix: true, allow_nil: true

  belongs_to :bus
  delegate :name, to: :bus, prefix: true, allow_nil: true

  scope :pending, -> { where(approved_at: nil) }
  scope :approved, -> { where("approved_at IS NOT NULL") }
  scope :approved_without_team, ->(user) { approved.where("team_id IS NULL OR team_id = ?", user.id) }

  def self.knows_about?(email)
    AccountChecker.knows_about?(email, checker_type)
  end

  def self.checker_type
    AccountChecker::Type::BUSPRENEURS
  end

  def approved?
    approved_at.present?
  end

  def approve!(approved_by = nil)
    self.approved_by = approved_by
    touch :approved_at
  end

  def to_s
    "#{name} (#{username}) <#{email}>"
  end

end
