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
      row("Buspreneurs") { bus.buspreneurs.pluck(:name).to_sentence }
      row("Image URL") { bus.image_url }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :ranking
      f.input :conductors
      f.input :teams
      f.input :image_url
      f.input :buspreneurs
    end

    f.actions
  end
end
