class MilestoneTeam < ActiveRecord::Base
  belongs_to :milestone
  belongs_to :team

  validates_uniqueness_of :team_id, scope: [:milestone_id]

end