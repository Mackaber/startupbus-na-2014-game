class InvestorsController < ApplicationController

  respond_to :html

  def show
    find_investor
    respond_with @investor
  end

  def request_buspreneurship
    @investor = Investor.find(params[:investor_id])
    @investor.request_buspreneurship
    redirect_to Buspreneur.find(@investor.id)
  end

  private

  def find_investor
    @investor = Investor.find(params[:id])
  end
end
