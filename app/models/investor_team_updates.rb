class InvestorTeamUpdates < ActiveRecord::Base
  belongs_to :team_update
  belongs_to :investor
end
