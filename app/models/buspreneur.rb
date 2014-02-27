class Buspreneur < Omniauthable
  belongs_to :attachable, polymorphic: true
  delegate :bus, to: :team, allow_nil: true

  delegate :name, to: :team, prefix: true, allow_nil: true
  delegate :name, to: :bus, prefix: true, allow_nil: true

  scope :pending, -> { where(approved_at: nil) }
  scope :approved, -> { where("approved_at IS NOT NULL") }
  scope :approved_without_team, ->(user) { approved.where("attachable_id IS NULL OR attachable_id = ?", user.id) }

  def self.knows_about?(email)
    AccountChecker.knows_about?(email, AccountChecker::Type::BUSPRENEURS)
  end

  def approved?
    approved_at.present?
  end

  def approve!(approved_by = nil)
    self.approved_by = approved_by
    touch :approved_at
  end

  def team
    attachable
  end

  def team=(team)
    self.attachable = team
  end

  def to_s
    "#{name} (#{username}) <#{email}>"
  end
end
