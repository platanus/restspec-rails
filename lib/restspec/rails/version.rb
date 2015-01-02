module Restspec
  module Rails
    RESTSPEC_VERSION = '0.2.6'
    RESTSPEC_RAILS_PATCH = ''
    VERSION = [RESTSPEC_VERSION, RESTSPEC_RAILS_PATCH].reject(&:empty?).join('.')
  end
end
