class BuspreneursController < ApplicationController
  respond_to :html

  before_filter :find_buspreneur, :authenticate_show, only: [:show]

  def show
    unless @buspreneur.approved?
      return render :not_allowed
    end

    respond_with @buspreneur
  end

  private

  def find_buspreneur
    @buspreneur = Buspreneur.find(params[:id])
  end

  def authenticate_show
    authorize! :show, @buspreneur
  end
end
