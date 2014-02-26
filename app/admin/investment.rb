ActiveAdmin.register Investment do
  index do
    selectable_column
    column :amount
    column :team
    column :investor
    actions
  end
end
