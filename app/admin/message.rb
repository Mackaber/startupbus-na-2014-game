ActiveAdmin.register Message do
  filter :teams
  filter :conductor
  filter :subject
  filter :body
  filter :type
  actions :index, :show, :new, :create

  index do
    selectable_column
    column :type
    column :subject
    column :body
    column :conductor
    column :team_names
    column :sent
    actions
  end

  show do |message|
    attributes_table do
      row("Type") { message.type }
      row("Subject") { message.subject }
      row("Body") { message.body }
      row("Sender") { message.conductor.name }
      row("Team Names") { message.teams.map(&:name).join(", ") }
      row("Sent") { message.sent }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :type
      f.input :subject
      f.input :body
      f.input :conductor
      f.input :teams, multiple: true, collection: Team.all
    end

    f.actions
  end
end