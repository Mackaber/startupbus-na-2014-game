ActiveAdmin.register Investor do
  batch_action :make_conductor do |collection|
    Investor.find(collection).each do |object|
      object.update_attribute(:type, "Conductor")
    end

    redirect_to collection_path, notice: "Conductor approved!"
  end

  batch_action :make_buspreneur do |collection|
    Investor.find(collection).each do |object|
      object.update_attribute(:type, "Buspreneur")
      object.becomes(Buspreneur).approve!(current_user)
    end

    redirect_to collection_path, notice: "Buspreneur approved!"
  end

  index do
    selectable_column
    column :name
    column :total_invested
    column :teams_invested
    column :bank

    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :bank
    end

    f.actions
  end

  show do |investor|
    attributes_table do
      row("name") { investor.name }
      row("username") { investor.username }
      row("email") { investor.email }
      row("investments") { investor.investments.map(&:amount).reduce(:+) }
      row("bank") { investor.bank }
    end
  end
end
