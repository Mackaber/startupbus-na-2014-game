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
      f.input :name
      f.input :email
      f.input :username
      f.input :phone_number
      f.input :description
      f.input :bus, collection: Bus.all
      f.input :blog
      f.input :facebook
      f.input :foursquare
      f.input :github
      f.input :linkedin
      f.input :twitter
      f.input :website
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
