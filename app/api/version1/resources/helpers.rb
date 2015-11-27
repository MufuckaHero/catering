module API
  module Version1
    module Helpers
      def warden
        request.env["warden"]
      end

      def current_user
        warden.person
      end

      def user_logged_in?
        warden.authenticated?(:account)
      end

      def authenticate_by_token!
        warden.authenticate!
      end

      def client_ip
        env["action_dispatch.remote_ip"].to_s
      end
    end
  end
end