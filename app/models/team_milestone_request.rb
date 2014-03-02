class TeamMilestoneRequest < ActiveRecord::Base
	belongs_to :team
	belongs_to :milestone
	has_one :bus, :through => :team
end
