class Milestone < ActiveRecord::Base
  has_many :teams, :through => :milestone_teams 
  has_many :milestone_teams
  has_many :buspreneurs, :through => :teams
end
