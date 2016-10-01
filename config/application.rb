require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-7.0.3-Q16'

module Narmadha
  class Application < Rails::Application
  	config.assets.precompile += %w( rails.js )
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
