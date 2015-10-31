require "grape"

module API
  module Version1
    class DailyMenus < ::Grape::API
      version 'v1', using: :path

      resource :daily_menus do
        desc "Returns sorted dm"
        get "/" do
          DailyMenu.order(id: :desc).all
        end

        desc "Return dm info"
        get "/:id" do
          @daily_menu = DailyMenu.find(params[:id])
          @daily_menu
        end
      end
    end
  end
end