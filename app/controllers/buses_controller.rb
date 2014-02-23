class BusesController < ApplicationController

  def new
    @bus = Bus.new
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def index
    @buses = Bus.includes(:teams).all
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to @bus, notice: 'Bus was successfully created.'
    else
      render action: "new"
    end
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :ranking, :conductor_id)
  end
end
