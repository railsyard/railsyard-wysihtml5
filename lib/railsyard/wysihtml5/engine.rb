module Railsyard
  module Wysihtml5
    class Engine < ::Rails::Engine

      initializer "Railsyard precompile hook" do |app|
        app.config.assets.precompile += [
          "railsyard/admin/railsyard_wysihtml5.js",
          "railsyard/admin/railsyard_wysihtml5.css"
        ]
      end

      config.to_prepare do
        Railsyard::Backend.plugin_manager.add_plugin(:wysihtml5) do
          name "Wysihtml5"
          backend_javascript_dependency "railsyard/admin/railsyard_wysihtml5"
          backend_stylesheet_dependency "railsyard/admin/railsyard_wysihtml5"

          generator_editor_type :wysihtml5, :text, <<DSL
as: :wysihtml5 do
      input_options toolbar:
        {commands: [:bold, :italic, :link, :image, :unordered_list, :ordered_list, :source]} # any of these
    end
DSL
        end
      end

    end
  end
end
