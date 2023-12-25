# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hrms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Permitted locales available for the application
    config.i18n.available_locales = %i[fr en pl]


    # Set default locale to something other than :en
    config.i18n.default_locale = :fr

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join("config/locales/*/.yml").to_s]

    # Load libs
    # Rails 5 disables autoloading after booting the app in production.
    config.eager_load_paths << Rails.root.join("lib")
    config.autoload_paths << Rails.root.join("lib")

    # Mailer
    config.action_mailer.default_url_options = { host: ENV['DOMAIN_NAME'] }
    config.action_mailer.default_options = { from: "no-reply@#{ENV['EMAIL_PROVIDER_DOMAIN_NAME']}" }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address: ENV['EMAIL_PROVIDER_ADDRESS'],
        user_name: ENV['EMAIL_PROVIDER_USERNAME'],
        password: ENV['EMAIL_PROVIDER_API_KEY'],
        domain: ENV['EMAIL_PROVIDER_DOMAIN_NAME'],
        port: 587,
        authentication: 'plain',
        enable_starttls_auto: true
    }
  end
end
