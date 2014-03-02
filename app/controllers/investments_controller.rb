class InvestmentsController < ApplicationController
  before_filter :find_team

  def new
    @investment = Investment.new do |investment|
      investment.investor = current_omniauthable
      investment.team = @team
    end
  end

  def create
    investment_params = params[:investment]
    amount = investment_params[:amount]

    @investment = Investment.new do |investment|
      investment.investor = current_omniauthable
      investment.team = @team
      Bitly.use_api_version_3
      bitly_client = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
      bit = bitly_client.shorten("#{@team.website}?utm_source=game&utm_medium=link&utm_campaign=#{current_omniauthable.name}")
      investment.url = bit.short_url
      investment.clicks = 0
    end

    ActiveRecord::Base.transaction do
      begin
        current_omniauthable.remove_funds(amount)
        @investment.amount = amount
        current_omniauthable.save!
        @investment.save!
      rescue ActiveRecord::RecordInvalid
        raise ActiveRecord::Rollback
      end
    end

    if current_omniauthable.save && @investment.save
      flash.notice = "#{@team.name} thanks you for investing $#{@investment.amount}!<br /><strong>Make sure to share your unique Team Short Link so that your score and the team's score goes up: <a href='#{@investment.url}'>#{@investment.url}</a></strong>"
      redirect_to teams_path
    else
      flash.alert = "Error with the transaction!"
      current_omniauthable.reload
      render :new
    end
  end

  private

  def find_team
    @team = Team.find(params[:team_id])
  end
end
