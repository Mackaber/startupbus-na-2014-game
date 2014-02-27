class BuspreneursController < ApplicationController
  respond_to :html

  before_filter :find_buspreneur
  before_filter :authenticate_show, only: [:show]

  def show
    respond_with @buspreneur
  end

  def not_allowed
    respond_with @buspreneur
  end

  private

  def find_buspreneur
    @buspreneur = Buspreneur.find(params[:id] || params[:buspreneur_id])
  end

  def authenticate_show
    authorize! :show, @buspreneur
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to buspreneur_not_allowed_path(@buspreneur)
  end
end
