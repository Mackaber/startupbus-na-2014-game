class Milestone < ActiveRecord::Base
  has_many :milestone_teams
  has_many :teams, :through => :milestone_teams 
  has_many :buspreneurs, :through => :teams
  has_many :team_milestone_requests
  accepts_nested_attributes_for :milestone_teams

  validates :target_completion_date, presence: true
end
