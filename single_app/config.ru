require 'rubygems'

require 'rails'
require 'active_support/railtie'
require 'action_dispatch/railtie'
require 'action_controller/railtie'

class SingleFile < Rails::Application

  config.eager_load = true
  config.cache_class = true


  config.secret_key_base = "p323421543543534"

  routes.append do
    root to: lambda { |env|
      [200, { "Content-Type" => "text/plain" }, ["Hello World"]}
    }
  end
end

SingleFile.initialize!
run Rails.application
