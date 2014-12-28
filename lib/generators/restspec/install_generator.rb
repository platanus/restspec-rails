require 'rails/generators'

module Restspec
  class InstallGenerator < ::Rails::Generators::Base
    desc "Install files for Restspec"
    source_root File.expand_path('../templates', __FILE__)

    def ensure_api_restspec_folder
      empty_directory "spec/api"
      empty_directory "spec/api/restspec"
    end

    def create_config_file
      template 'restspec_config.rb', "spec/api/restspec/restspec_config.rb"
    end

    def create_api_dsl_files
      create_file "spec/api/restspec/endpoints.rb"
      create_file "spec/api/restspec/schemas.rb"
      create_file "spec/api/restspec/requirements.rb"
    end

    def modify_spec_helper
      prepend_to_file rspec_helper_file, "require 'restspec'\n\n"
      gsub_file rspec_helper_file, "RSpec.configure do |config|" do
"RSpec.configure do |config|
  # Restspec helpers and macros
  config.include Restspec::RSpec::ApiHelpers, :type => :api
  config.extend Restspec::RSpec::ApiMacros, :type => :api
"
      end
      append_to_file rspec_helper_file, "\nrequire_relative './api/restspec/restspec_config'\n"
    end

    private

    def rspec_helper_file
      'spec/rails_helper.rb'
    end
  end
end
