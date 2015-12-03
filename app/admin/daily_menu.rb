ActiveAdmin.register DailyMenu do

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

permit_params :day_number, :max_total, :day_count, dish_ids: []

  index do
    selectable_column
    column "Day", :day_number
    column :max_total
    column "Dishes and Business Lunches" do |dish|
      dish.dish_ids.each do |id| 
        span Dish.where(id: id).first.title 
      end
    end
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'DailyMenu' do
      f.input :day_number,label: "Day", as: :select, :selected => 'Monday', collection: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
      f.input :max_total
      f.input :dish_ids, as: :select2_multiple, collection: Dish.all 
    end        
    f.actions        
  end

  config.sort_order = 'day_count_asc'
end
