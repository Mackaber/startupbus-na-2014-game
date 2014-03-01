ActiveAdmin.register Game do
  filter :name

  #actions :index, :show, :destroy
  index do
    selectable_column
    column :id
    column :name
    column :start_of_game
    column :end_of_game
    column :description
    actions
  end

  show do |game|
    attributes_table do
      row("ID") { game.id }
      row("Name") { game.name }
      row("Start Time") { game.start_of_game }
      row("End Time") { game.end_of_game }
      row("Description" ) { game.description }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :start_of_game, as: :datetime_picker
      f.input :end_of_game, as: :datetime_picker
      f.input :description
    end

    f.actions
  end
end