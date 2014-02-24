class HomeController < ApplicationController
  def index
    if omniauthable_signed_in?
      redirect_to current_omniauthable, action: :welcome
    end
  end
end
