require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Catering
  class Application < Rails::Application
    config.generators do |g|
      g.test_flamework :rspec
      g.stylesheets false
      g.javascript false
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
