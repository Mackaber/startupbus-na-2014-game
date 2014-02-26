class MilestonesController < ApplicationController

  def index
    @milestones = Milestone.all
  end


end