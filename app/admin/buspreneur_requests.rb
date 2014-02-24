ActiveAdmin.register Buspreneur, as: "Buspreneur Requests" do

  config.filters = false

  batch_action :approve do |buspreneurs|
    Buspreneur.find(buspreneurs).each do |buspreneur|
      buspreneur.approve!(current_omniauthable)
    end

    redirect_to collection_path, notice: "Buspreneurs approved!"
  end

  member_action :approve, method: :put do
    buspreneur = Buspreneur.find(params[:id])
    buspreneur.approve!(current_omniauthable)
    redirect_to collection_path, notice: "Buspreneur approved!"
  end

  action_item only: [:index] do |resource|
    link_to "Approve", approve_admin_buspreneur_request_path(resource)
  end

  index do
    selectable_column
    column :identifier
    column :name
    column :email
    actions
  end

  controller do
    def scoped_collection
      Buspreneur.pending
    end
  end
end
