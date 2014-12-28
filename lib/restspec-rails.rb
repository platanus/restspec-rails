require 'rails'

require_relative './generators/restspec/install_generator'

module Restspec
  module Rails
  end
end

class Restspec::Rails::Engine < Rails::Engine
end
