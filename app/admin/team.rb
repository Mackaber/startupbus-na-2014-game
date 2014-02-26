ActiveAdmin.register Team do
  filter :name
  filter :created_at

  index do
    selectable_column
    column :name
    column :buspreneur_names
    actions
  end

  show do |team|
    attributes_table do
      row("Name")           { team.name }
      row("Website")        { team.website }
      row("Twitter Handle") { team.twitter_handle }
      row("Facebook URL")   { team.facebook_url }
      row("Github URL")     { team.github_url }
      row("Description")    { team.description }
      row("Created")        { team.created_at }
      row("Bus")            { team.bus_name }
      row("Buspreneurs")    { team.buspreneurs.map(&:email).join(", ") }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :bus
      f.input :website
      f.input :github_url
      f.input :twitter_handle
      f.input :facebook_url
      f.input :description
      f.input :buspreneurs, multiple: true, collection: Buspreneur.approved_without_team(f.object)

      f.has_many :milestone_teams do |app_f|
        app_f.inputs "Completed Milestones" do
          app_f.input :awarded_points
          app_f.input :milestone_id
          app_f.input :team_id
        end
    end

    f.actions
  end



  end

end
