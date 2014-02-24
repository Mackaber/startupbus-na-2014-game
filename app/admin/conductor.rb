ActiveAdmin.register Conductor do
  config.filters = false

  index do
    selectable_column
    column :name
    column :email
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
      f.input :created_at
      f.input :attachable,
        label: "Bus",
        as: :select,
        collection: options_from_collection_for_select(
          Bus.all,
          :id,
          :name,
          f.object.attachable_id
        )
    end

    f.actions
  end

end
