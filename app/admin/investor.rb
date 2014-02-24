ActiveAdmin.register Investor do
  batch_action :make_conductor do |collection|
    Investor.find(collection).each do |object|
      object.update_attribute(:type, "Conductor")
    end

    redirect_to collection_path, notice: "Conductor approved!"
  end
end
