class InvestorGame < ActiveRecord::Base
  belongs_to :investor
  belongs_to :investment
  belongs_to :game
  
end
