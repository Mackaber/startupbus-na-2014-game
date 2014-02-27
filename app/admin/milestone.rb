ActiveAdmin.register MilestoneTeam::Milestone do
  filter :name
  filter :target_completion_date

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :max_points
      f.input :target_completion_date, as: :datetime_picker
      f.input :validation_instructions
      f.input :public_instructions
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :target_completion_date
    column :max_points
    actions
  end
end
