require "grape"

module API
  module Version1
    class Sprints < ::Grape::API
   
      resource :sprints do
        desc "Returns sorted sprints"
        get "/" do
          Sprint.order(id: :desc).all
          
        end

        desc "Return sprint info"
        get "/:id" do
          @sprint = Sprint.find(params[:id])
          @sprint
        end
      end
    end
  end
end