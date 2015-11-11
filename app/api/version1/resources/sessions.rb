require "grape"

module API
  module Version1
    class Sessions < ::Grape::API
      version 'v1', using: :path
      format :json
      default_format :json
      default_error_formatter :json
      content_type :json, 'application/json'

      resource :sessions do
        desc "Returns token"

        params do
          requires :email, type: String, desc: "Email"
          requires :password, type: String, desc: "Password"
        end

        post do
          email = params[:email]
          password = params[:password]

          if email.nil? or password.nil?
            error!({error_code: 404, error_message: "Invalid Email or Password."},401)
            return
          end

          user = Person.where(email: email.downcase).first
          if user.nil?
            error!({error_code: 404, error_message: "Invalid Email or Password."},401)
            return
          end

          if !user.valid_password?(password)
            error!({error_code: 404, error_message: "Invalid Password or Password."},401)
            return
          else
            user.ensure_authentication_token
            user.save
            {auth: true, token: user.authentication_token}
          end
        end

        desc "Need token", headers: {
          "X-Auth-Token" => {
            description: "User token",
            required: true
          }
        }

        delete 'authentication_token' do
          authentication_token = headers['X-Auth-Token']
          user = Person.where(authentication_token: authentication_token).first
          if user.nil?
            error!({error_code: 404, error_message: 'Invalid token.'}, 401)
            return
          else
            user.reset_authentication_token!
            {status: 'ok'}
          end
        end
      end
    end
  end
end
