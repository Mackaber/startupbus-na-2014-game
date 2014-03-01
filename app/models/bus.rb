class Bus < ActiveRecord::Base
  validates :name, :uniqueness => true

  validates_format_of :image_url, :with => URI::regexp(%w(http https))

  has_many :conductors, as: :attachable
  has_many :teams
  has_many :buspreneurs, through: :teams

  def conductor_names
    conductors.pluck(:name).to_sentence
  end

  def team_names
    teams.pluck(:name).to_sentence
  end
end
