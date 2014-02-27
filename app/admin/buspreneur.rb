ActiveAdmin.register Buspreneur do
  index do
    selectable_column
    column :name
    column :username
    column :email
    column :team_name
    column :bus_name
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :approved?, as: :radio, input_html: { disabled: true }
      f.input :attachable, label: "Team", collection: Team.all
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
    end
  end
end
