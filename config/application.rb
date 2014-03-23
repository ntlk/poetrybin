require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Poetrybin
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.i18n.default_locale = :en
    I18n.enforce_available_locales = false
    config.serve_static_assets = true
  end
end
