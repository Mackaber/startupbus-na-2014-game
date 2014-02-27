ActiveAdmin.register Conductor do
  config.filters = false

  index do
    selectable_column
    column :name
    column :email
    column :bus_name
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :attachable, label: "Bus", collection: Bus.all
    end

    f.actions
  end

  show do |conductor|
    attributes_table do
      row("Name") { conductor.name }
      row("Username") { conductor.username }
      row("Email") { conductor.email }
      row("Bus") { conductor.bus_name }
      row("Teams") { conductor.bus_team_names }
    end
  end
end
