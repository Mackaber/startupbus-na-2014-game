class BusesController < ApplicationController

  def show
    @bus = Bus.find(params[:id])
  end

  def index
    @buses = Bus.includes(:teams).all
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :ranking, :conductor_id)
  end
end
