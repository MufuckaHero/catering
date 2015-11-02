require "grape"

module API
  module Version1
    class Sessions < ::Grape::API
      version 'v1', using: :path

    end
  end
end
