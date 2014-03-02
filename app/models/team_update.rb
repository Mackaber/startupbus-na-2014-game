class TeamUpdate < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :body, :subject
  has_many :investor_team_updates
  has_many :investors, through: :investor_team_updates
end
