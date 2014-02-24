ActiveAdmin.register Buspreneur do
  index do
    selectable_column
    column :name
    column :username
    column :email
    column :team_name
    column :bus_name
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :sign_in_count
      f.input :provider
      f.input :uid
      f.input :approved_at
      f.input :approved_by
      f.input :created_at
      f.input :attachable,
        as: :select,
        collection: options_from_collection_for_select(
          Team.all,
          :id,
          :name,
          f.object.attachable_id
        )
    end

    f.actions
  end
end
