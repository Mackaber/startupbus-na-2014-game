ActiveAdmin.register TeamUpdate do
  filter :subject
  filter :body
  actions :index, :show
  form do |f|
    f.inputs do
      f.input :team
      f.input :subject
      f.input :body
    end

    f.actions
  end

  show do |team_update|
    attributes_table do
      row("Team")           { team_update.team.name }
      row("Subject")        { team_update.subject }
      row("Body")           { team_update.body }
      row("Sent Count")     { team_update.investor_team_updates.count }
      row("Sent To")        { team_update.investors.map(&:name).to_sentence }
      row("Created At")     { team_update.created_at }
    end
  end

  index do
    selectable_column
    column :team
    column :subject
    column :body
    actions
  end
end
