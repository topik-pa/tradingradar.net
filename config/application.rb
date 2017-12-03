require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AgendaTrading
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.time_zone = 'Europe/Rome'
    
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w( ckeditor/* )
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    
    
    
    
    config.action_mailer.smtp_settings = {
      address: "authsmtp.securemail.pro",
      port: 465,
      user_name: "marco@tradingradar.net",
      password: "IsMPsd80",
      authentication: :plain,
      enable_starttls_auto: true
    }
    
    config.action_mailer.default_url_options = {
      host: "tradingradar.net"
    }
    
    
  end
end
