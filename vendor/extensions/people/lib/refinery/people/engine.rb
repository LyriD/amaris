module Refinery
  module People
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::People

      engine_name :refinery_people

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "people"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.people_admin_people_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/people/person',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::People)
      end
    end
  end
end
