require 'rails'
require 'restspec'

require_relative './generators/restspec/install_generator'
require_relative './restspec/rails/network_adapter'

module Restspec
  module Rails
  end
end

class Restspec::Rails::Engine < Rails::Engine
end
