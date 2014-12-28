Restspec.configure do |config|
  config.schema_definition = "#{File.dirname __FILE__}/schemas.rb"
  config.endpoints_definition = "#{File.dirname __FILE__}/endpoints.rb"
  config.requirements_definition = "#{File.dirname __FILE__}/requirements.rb"

  # This is important for Rails :)
  config.request.network_adapter = ->{ Restspec::Rails::NetworkAdapter.new }

  #
  # => to add custom headers, use config.request.headers like this:
  #
  # config.request.headers['AUTHORIZATION'] = "Token token=\"#{config.custom.api_key}\""
end
