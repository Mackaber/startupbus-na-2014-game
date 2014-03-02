ActiveAdmin.register Team do
  filter :name
  filter :created_at

  index do
    selectable_column
    column :name
    column :buspreneur_names
    column :short_url
    actions
  end

  show do |team|
    attributes_table do
      row("Name")           { team.name }
      row("Website")        { team.website }
      row("Short URL")      { team.short_url }
      row("Twitter Handle") { team.twitter_handle }
      row("Facebook URL")   { team.facebook_url }
      row("Github URL")     { team.github_url }
      row("Description")    { team.description }
      row("Created")        { team.created_at }
      row("Bus")            { team.bus_name }
      row("Buspreneurs")    { team.buspreneurs.map(&:email).to_sentence }
      row("RSS Feed")       { team.rss_feed }
      row("Logo URL")       { team.logo_url }
      row("Milestones")     { team.milestones.map(&:name).to_sentence }
      row("Short URL")      { team.short_url }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :bus
      f.input :website
      f.input :github_url
      f.input :twitter_handle
      f.input :facebook_url
      f.input :description
      f.input :buspreneurs, multiple: true, collection: Buspreneur.approved_without_team(f.object)

      f.has_many :milestone_teams, :allow_destroy => true do |app_f|
        app_f.inputs do
          app_f.input :milestone_id, multiple: false, :as => :select, collection: Milestone.all
          app_f.input :team_id, :as => :select, collection: Team.all
          app_f.input :description
          app_f.input :url
        end
      end
      f.input :rss_feed
      f.input :logo_url
      f.input :short_url
    end

    f.actions
  end
end
