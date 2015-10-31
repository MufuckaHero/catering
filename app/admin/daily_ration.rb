ActiveAdmin.register DailyRation do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params :price, :quantity, :person_id, :daily_menu_id, :sprint_id, :dish_id

  index do
    selectable_column
    column :person_id
    column :quantity
    column :price
    column :sprint_id
    column :daily_menu_id
    column :dish_id
    column :updated_at
    actions
  end
end
