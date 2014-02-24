class Conductor < Omniauthable
  belongs_to :bus, polymorphic: true

  delegate :name, to: :bus, prefix: true, allow_nil: true

  def approved?
    approved_at.present?
  end

  def approve!
    touch :approved_at
  end

  def admin?
    true
  end
end
