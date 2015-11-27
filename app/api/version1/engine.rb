require 'action_dispatch/middleware/remote_ip.rb'

module API
  module Version1
    autoload :Sessions, 'version1/resources/sessions'
    autoload :Sprints, 'version1/resources/sprints'
    autoload :DailyMenus, 'version1/resources/daily_menus'
    autoload :Helpers, 'version1/resources/helpers'

    class Engine <  ::Grape::API
      format :json
      default_format :json
      default_error_formatter :json
      content_type :json, "application/json"
      version 'v1', using: :path

      use ActionDispatch::RemoteIp

      helpers API::Version1::Helpers
     
      mount API::Version1::Sessions
      mount API::Version1::Sprints
      mount API::Version1::DailyMenus
      
      add_swagger_documentation base_path: "/api", hide_documentation_path: true, api_version: "v1"

      get "/" do
        {:timenow => Time.zone.now.to_i }
      end
    end
  end
end
