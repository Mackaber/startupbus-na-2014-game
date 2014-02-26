class MilestoneTeam < ActiveRecord::Base
  belongs_to :milestones
  belongs_to :teams

end