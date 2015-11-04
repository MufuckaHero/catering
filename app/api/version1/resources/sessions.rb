require "grape"

module API
  module Version1
    class Sessions < ::Grape::API
      version 'v1', using: :path

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
            user.save
            {status: 'ok', token: user.authentication_token}
          end
        end

        desc 'Destroy token'

        params do
          requires :authentication_token, type: String, desc: 'User Access Token'
        end
        delete 'authentication_token' do
          authentication_token = params[:authentication_token]
          user = Person.where(authentication_token: authentication_token).first
          if user.nil?
            error!({error_code: 404, error_message: 'Invalid token.'}, 401)
            return
          else
            user.reset_authentication_token
            {status: 'ok'}
          end
        end
      end
    end
  end
end
