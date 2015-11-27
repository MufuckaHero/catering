ActiveAdmin.register BusinessLunch do

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
  permit_params :title, :sort_order, :description, :price, :type, :category_id, children_ids: []

  index do
    selectable_column
    column :sort_order
    column :title
    column :price
    column :updated_at
    column :children_ids
    actions
  end

  config.sort_order = 'sort_order_asc'

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'BusinessLunch' do
      f.input :sort_order
      f.input :title
      f.input :price
      f.input :description
      f.input :children_ids, as: :select2_multiple, collection: OneDish.all
      f.input :category_id
    end        
    f.actions        
  end
end
