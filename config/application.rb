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
    
    
    
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.default :charset => "utf-8"
    
    config.action_mailer.smtp_settings = {
      address:          "smtp.mail.yahoo.com",
      port:             587,
      domain:           "yahoo.com",
      authentication:   "plain",
      user_name:        "agendatrading@yahoo.com",
      password:         "IsMPsd80",
      enable_starttls_auto:   true
    }
    
    config.action_mailer.default_url_options = {
      host: "tradingradar.net"
    }
    

    
  end
end
