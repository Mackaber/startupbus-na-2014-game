ActiveAdmin.register Bus do
  filter :name

  index do
    selectable_column
    column :name
    column :conductor_names
    column :team_names
    actions
  end

  show do |bus|
    attributes_table do
      row("Name") { bus.name }
      row("Conductors") { bus.conductor_names }
      row("Teams") { bus.team_names }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :ranking
      f.input :conductors,
        as: :select,
        multiple: true,
        collection: options_from_collection_for_select(
          Conductor.all,
          :id,
          :email,
          f.object.conductor_ids
        )
      f.input :teams,
        as: :select,
        multiple: true,
        collection: options_from_collection_for_select(
          Team.all,
          :id,
          :name,
          f.object.team_ids
        )
    end

    f.actions
  end
end
