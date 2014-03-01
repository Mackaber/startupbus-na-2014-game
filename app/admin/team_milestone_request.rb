ActiveAdmin.register TeamMilestoneRequest do
  filter :team
  filter :bus
  filter :milestone

  index do
    selectable_column
    column :team
    column :bus
    column :milestone
    column :url
    column :description
    column :created_at
    actions
  end

  show do |team_milestone_request|
    attributes_table do
      row("Team") { team_milestone_request.team.name }
      row("Bus") { team_milestone_request.team.bus.name }
      row("Milestone") { team_milestone_request.milestone.name }
      row("URL") { team_milestone_request.url }
      row("Description") { team_milestone_request.description }
      row("Submitted At" ) { team_milestone_request.created_at }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :team, collection: Team.all
      f.input :milestone, collection: Milestone.all
      f.input :url
      f.input :description
    end

    f.actions
  end
end