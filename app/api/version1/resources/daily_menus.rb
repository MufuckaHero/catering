require "grape"

module API
  module Version1
    class DailyMenus < ::Grape::API
      version 'v1', using: :path

      resource :daily_menus do
        desc "Returns sorted dm"
        get "/" do
          _dailymenu = DailyMenu.order(day_count: :desc).all.as_json
          _dishes = Dish.all
          _category = Category.all
          _dailymenu.each do |dm|
            dm['dishes'] = _dishes.select { |l| dm['dish_ids'].include?(l.id) }.as_json
            dm['dishes'].each do |dd| 
              dd['category'] = _category.where(id: dd['category_id'])[0]['title'] 
              dd['children'] = _dishes.select { |l| dd['children_ids'].include?(l.id) }.as_json
            end
          end
          _dailymenu
        end
      end
    end
  end
end