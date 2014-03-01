ActiveAdmin.register Buspreneur do
  index do
    selectable_column
    column :name
    column :username
    column :email
    column :team_name
    column :bus_name
    column :phone_number
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :username
      f.input :phone_number
      f.input :description
      f.input :approved?, as: :radio, input_html: { disabled: true }
      f.input :bus, collection: Bus.all
      f.input :team, collection: f.object.bus.teams,
        label: "Team (only teams that are in selected bus)"
      f.input :phone_number
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

  show do |buspreneur|
    attributes_table do
      row("name") { buspreneur.name }
      row("username") { buspreneur.username }
      row("email") { buspreneur.email }
      row("team") { buspreneur.team }
      row("bus") { buspreneur.bus }
      row("phone number") { buspreneur.phone_number }
    end
  end
end
