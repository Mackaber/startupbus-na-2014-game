ActiveAdmin.register Message do
  filter :teams
  filter :conductor
  filter :subject
  filter :body
  filter :delivery_method
  actions :index, :show, :new, :create

  index do
    selectable_column
    column :delivery_method
    column :subject
    column :body
    column :conductor
    column :team_names
    column :sent
    actions
  end

  show do |message|
    attributes_table do
      row("Delivery Method") { message.delivery_method }
      row("Subject") { message.subject }
      row("Body") { message.body }
      row("Sender") { message.conductor.name }
      row("Team Names") { message.teams.map(&:name).join(", ") }
      row("Sent") { message.sent }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :delivery_method, :as => :radio, :collection => ["SMS", "E-Mail"], :value_method => :delivery_method
      f.input :subject
      f.input :body
      f.input :teams, multiple: true, collection: Team.all
    end

    f.actions
  end



  controller do
    def create
      params["message"]["conductor_id"] = current_user.id
      create!
    end
  end
end