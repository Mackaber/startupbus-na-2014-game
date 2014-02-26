class Conductor < Omniauthable
  belongs_to :attachable, polymorphic: true

  delegate :name, :team_names, to: :bus, prefix: true, allow_nil: true
  
  def approve!(approved_by = nil)
    self.approved_by = approved_by
    touch :approved_at
  end

  def admin?
    true
  end

  def bus
    attachable
  end

  def bus=(bus)
    self.attachable = bus
  end

  def to_s
    name
  end
end
