require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module NewsApp
  class Application < Rails::Application
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    config.active_job.queue_adapter = :sidekiq
  end
end
