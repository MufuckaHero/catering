require "grape"

module API
  module Version1
    class Sprints < ::Grape::API
   
      resource :sprints do
        desc "Returns sorted sprints"
        get "/" do
          Sprint.where.not(aasm_state: "closed").order(id: :desc).all.as_json 
        end

        desc "Return sprint info"
        get "/:id" do
          Sprint.where.not(aasm_state: "closed").find(params[:id]).as_json 
        end
      end
    end
  end
end