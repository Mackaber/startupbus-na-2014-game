ActiveAdmin.register TeamMilestoneRequest do
  filter :team
  filter :bus
  filter :milestone
  actions :index, :show, :destroy
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

  member_action :approve, :method => :get do
    team_milestone_request = TeamMilestoneRequest.find(params[:id])
    mt = MilestoneTeam.new
    mt.approved_by = current_omniauthable
    mt.milestone = team_milestone_request.milestone
    mt.team = team_milestone_request.team
    mt.save!
    team_milestone_request.destroy!
    redirect_to collection_path, notice: "Milestone approved!"
  end

  action_item :only => [:show] do
    link_to "Approve", approve_admin_team_milestone_request_path(params[:id])
  end
end