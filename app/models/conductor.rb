class Conductor < Omniauthable
  belongs_to :attachable, polymorphic: true

  delegate :name, to: :bus, prefix: true, allow_nil: true

  def self.known_email_addresses
    (ENV["CONDUCTOR_EMAIL_ADDRESSES"] || "").split(",").freeze
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
