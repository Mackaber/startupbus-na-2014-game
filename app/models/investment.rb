class Investment < ActiveRecord::Base
  belongs_to :investor
  belongs_to :team

  validates :amount, presence: true

  def to_s
    "$#{amount}"
  end
end
