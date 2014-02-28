class TeamMessage < ActiveRecord::Base
	belongs_to :message
	belongs_to :team
end
