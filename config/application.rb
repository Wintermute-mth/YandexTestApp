require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module NewsApp
  class Application < Rails::Application
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
  end
end
