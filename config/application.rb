require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Liveapp
	class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
		config.secret_key_base = '<%= ENV["SECRET_KEY_BASE"] %>'

    config.action_dispatch.default_headers.merge!({
    	'Access-Control-Allow-Origin' => '*',
    	'Access-Control-Request-Method' => '*'
    	})
end
end
