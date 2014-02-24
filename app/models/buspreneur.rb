class Buspreneur < Omniauthable
  belongs_to :attachable, polymorphic: true
  delegate :bus, to: :team, allow_nil: true

  delegate :name, to: :team, prefix: true, allow_nil: true
  delegate :name, to: :bus, prefix: true, allow_nil: true

  scope :pending, where(approved_at: nil)

  def approved?
    approved_at.present?
  end

  def approve!(approved_by)
    self.approved_by = approved_by
    touch :approved_at
  end

  def team
    attachable
  end

  def team=(team)
    self.attachable = team
  end
end
