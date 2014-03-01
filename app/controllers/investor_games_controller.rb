class InvestorGamesController < ApplicationController

  def index
    @investor_games = InvestorGame.all
  end
end
