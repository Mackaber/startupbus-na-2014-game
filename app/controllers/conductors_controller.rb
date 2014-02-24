class ConductorsController < ApplicationController
  before_filter :find_conductor, only: [:show]

  def show
  end

  def find_conductor
    @conductor = Conductor.find(params[:id])
  end
end
