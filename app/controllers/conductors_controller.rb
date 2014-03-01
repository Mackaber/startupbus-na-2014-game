class ConductorsController < ApplicationController
  respond_to :html

  before_filter :find_conductor, except: [:index]
  before_filter :authorize_update, only: [:edit, :update]

  def index
    @conductors = Conductor.approved.all
    respond_with @conductors
  end

  def show
  end

  def edit
  end

  def update

    @conductor.update_attributes(params[:conductor])
    respond_with @conductor
  end

  private

  def find_conductor
    @conductor = Conductor.find(params[:id])
  end

  def authorize_update
    authorize! :edit, @conductor
  end
end
