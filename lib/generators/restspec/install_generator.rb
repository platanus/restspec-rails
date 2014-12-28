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
      template 'templates/restspec_config.rb', "spec/api/restspec/restspec_config.rb"
    end

    def create_api_dsl_files
      create_file "spec/api/restspec/api_endpoints.rb"
      create_file "spec/api/restspec/api_schemas.rb"
      create_file "spec/api/restspec/api_requirements.rb"
    end

    def modify_spec_helper
      prepend_to_file "spec/rails_helper.rb", "require 'restspec'"
      binding.pry
    end
  end
end
