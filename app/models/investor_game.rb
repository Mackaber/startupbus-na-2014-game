class InvestorGame < ActiveRecord::Base
  belongs_to :investors
  belongs_to :investments
  belongs_to :game
  
end
