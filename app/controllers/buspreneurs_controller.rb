class BuspreneursController < ApplicationController
  respond_to :html

  before_filter :find_buspreneur, except: [:index]
  before_filter :authorize_update, only: [:edit, :update]

  def index
    @buspreneurs = Buspreneur.approved
    respond_with @buspreneurs
  end

  def show
    respond_with @buspreneur
  end

  def edit
  end

  def update
    @buspreneur.update_attributes(params[:buspreneur])
    respond_with @buspreneur
  end

  def not_allowed
    respond_with @buspreneur
  end

  private

  def find_buspreneur
    @buspreneur = Buspreneur.find(params[:id] || params[:buspreneur_id])
  end

  def authorize_update
    authorize! :edit, @buspreneur
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to buspreneur_not_allowed_path(@buspreneur)
  end
end
