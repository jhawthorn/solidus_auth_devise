module Solidus
  module Auth
    module Generators
      class InstallGenerator < Rails::Generators::Base
        def self.source_paths
          paths = self.superclass.source_paths
          paths << File.expand_path('../templates', __FILE__)
          paths.flatten
        end

        def generate_devise_key
          template 'config/initializers/devise.rb', 'config/initializers/devise.rb', skip: true
        end

        def add_migrations
          run 'bundle exec rake railties:install:migrations FROM=solidus_auth_devise'
        end
      end
    end
  end
end
