class InvestmentsController < ApplicationController
  before_filter :find_team
  before_filter :find_investment, only: [:edit]
  def new
    @investment = Investment.new do |investment|
      investment.investor = current_omniauthable
      investment.team: params[:team_id])
    end
  end

  def create
  end
end
