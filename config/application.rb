require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YariiExampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    path = Gem.loaded_specs['yarii-editor'].full_gem_path
    config.middleware.use(
      Rack::Static,
      urls: ["/yarii-editor-packs"], root: "#{path}/public"
    )

    config.content_models = config_for(:content_models)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
