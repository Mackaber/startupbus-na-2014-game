class TeamMilestoneRequest < ActiveRecord::Base
	belongs_to :team
	belongs_to :milestone
end
