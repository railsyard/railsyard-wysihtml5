module Railsyard
  module Wysihtml5
    class Engine < ::Rails::Engine

      initializer "Railsyard precompile hook", :group => :all do |app|
        app.config.assets.precompile += [
          "railsyard/admin/railsyard_wysihtml5.js",
          "railsyard/admin/railsyard_wysihtml5.css"
        ]
      end

      config.to_prepare do
        editor_config = <<DSL
field :%{name}, as: :wysihtml5 do
      input_options toolbar:
        {commands: [:bold, :italic, :link, :image, :unordered_list, :ordered_list, :source]} # any of these
    end
DSL
        Railsyard::Backend.plugin_manager.add_plugin(:wysihtml5) do
          name "Wysihtml5"
          backend_javascript_dependency "railsyard/admin/railsyard_wysihtml5"
          backend_stylesheet_dependency "railsyard/admin/railsyard_wysihtml5"
          generator_editor_type(:wysihtml5,
                                {"%{name}" => :text},
                                editor_config)
        end
      end

    end
  end
end
