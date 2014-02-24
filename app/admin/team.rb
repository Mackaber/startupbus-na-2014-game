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
    render "form"
  end

end
