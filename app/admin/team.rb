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
      f.input :bus,
        as: :select,
        collection: options_from_collection_for_select(
          Bus.all,
          :id,
          :name,
          f.object.bus_id
        )
      f.input :website
      f.input :github_url
      f.input :twitter_handle
      f.input :facebook_url
      f.input :description
      f.input :buspreneurs,
        as: :select,
        multiple: true,
        collection: options_from_collection_for_select(
          Buspreneur.approved_without_team(f.object),
          :id,
          :email,
          f.object.buspreneur_ids
        )
    end

    f.actions
  end

end
