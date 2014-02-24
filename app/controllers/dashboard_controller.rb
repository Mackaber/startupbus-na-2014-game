class DashboardController < ApplicationController
	before_filter :authenticate_omniauthable!

	def index
    @buses = Bus.includes(:teams).all.sort_by {|bus| bus.ranking}
	end
end
