ActiveAdmin.register MilestoneTeam::Milestone do
  filter :name
  filter :max_points
  filter :target_completion_date
  filter :start_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :max_points
      f.input :start_at, as: :datetime_picker
      f.input :target_completion_date, as: :datetime_picker
      f.input :validation_instructions
      f.input :public_instructions
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :start_at
    column :target_completion_date
    column :max_points
    actions
  end
end
