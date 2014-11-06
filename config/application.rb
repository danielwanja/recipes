require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Recipes
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # CORS: rack-cors (didn't work)
    # rack-cors
    # config.middleware.insert_after Rails::Rack::Logger, Rack::Cors, :debug => true, :logger => Rails.logger do
    #   allow do
    #     origins '*' # '*.blinker.com'
    #     resource '*', :headers => :any, :methods => [:head, :get, :post, :put, :patch, :delete, :options]
    #   end
    # end

    # FROM: http://stackoverflow.com/questions/19883497/heroku-rails-cors-issue
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => 'POST, PUT, PATCH, DELETE, GET, OPTIONS',
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }

  end
end
