module Railsyard
  module Wysihtml5
    class Engine < ::Rails::Engine
      config.to_prepare do
        Railsyard::Backend.plugin_manager.add_plugin(:wysihtml5) do
          name "Wysihtml5"
          backend_javascript_dependency "railsyard/admin/railsyard_wysihtml5"
          backend_stylesheet_dependency "railsyard/admin/railsyard_wysihtml5"
        end
      end
    end
  end
end
