module Railsyard
  module Wysihtml5
    module Inputs

      class Wysihtml5Input < SimpleForm::Inputs::TextInput
        def input

          toolbar_options = options[:toolbar] || {}
          toolbar_commands = toolbar_options[:commands] || [ :bold, :italic, :link ]
          toolbar_blocks = toolbar_options[:blocks] || []

          out = ''
          out << '<div class="wysihtml5-toolbar" style="display: none;">'

          if toolbar_blocks.any?
            out << "<div class='wysihtml5-blocks'><span>#{I18n.t("wysihtml5.block_style")}</span><ul>"
            toolbar_blocks.each do |type|
              out << "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='#{type}'>#{I18n.t("wysihtml5.blocks." + type.to_s, default: type.to_s)}</a></li>"
            end
            out << '</ul></div>'
          end

          toolbar_commands.each do |type|
            out << toolbar_command(type)
          end


          out << "<div class='wysihtml5-dialog' data-wysihtml5-dialog='createLink' style='display: none;'>
            <label>#{I18n.t("wysihtml5.link_url")}</label>
            <input data-wysihtml5-dialog-field='href' value='http://' type='text'>
            <footer>
              <a data-wysihtml5-dialog-action='cancel'>#{I18n.t("wysihtml5.cancel")}</a>
              <a class='save button' data-wysihtml5-dialog-action='save'>#{I18n.t("wysihtml5.ok")}</a>
            </footer>
          </div>" if toolbar_commands.include? :link

          out << "<div class='wysihtml5-dialog' data-wysihtml5-dialog='insertImage' style='display: none;'>
            <label>#{I18n.t("wysihtml5.image_src")}</label>
            <input data-wysihtml5-dialog-field='src' value='http://' type='text'>
            <label>#{I18n.t("wysihtml5.image_alignment")}</label>
            <select data-wysihtml5-dialog-field='className'>
              <option value=''>#{I18n.t("wysihtml5.alignments.none")}</option>
              <option value='wysiwyg-float-left'>#{I18n.t("wysihtml5.alignments.left")}</option>
              <option value='wysiwyg-float-center'>#{I18n.t("wysihtml5.alignments.center")}</option>
              <option value='wysiwyg-float-right'>#{I18n.t("wysihtml5.alignments.right")}</option>
            </select>
            <footer>
              <a data-wysihtml5-dialog-action='cancel'>#{I18n.t("wysihtml5.cancel")}</a>
              <a class='save button' data-wysihtml5-dialog-action='save'>#{I18n.t("wysihtml5.ok")}</a>
            </footer>
          </div>" if toolbar_commands.include? :image

          out << '</div>'

          out << super
          "<div class='wysihtml5-wrapper'>#{out}</div>".html_safe
        end

        private

        def toolbar_command(type)
          case type
          when :bold
            "<a class='bold' data-wysihtml5-command='bold'>#{I18n.t("wysihtml5.bold")}</a>"
          when :italic
            "<a class='italic' data-wysihtml5-command='italic'>#{I18n.t("wysihtml5.italic")}</a>"
          when :link
            "<a class='link' data-wysihtml5-command='createLink'>#{I18n.t("wysihtml5.link")}</a>"
          when :image
            "<a class='image' data-wysihtml5-command='insertImage'>#{I18n.t("wysihtml5.image")}</a>"
          when :unordered_list
            "<a class='ul' data-wysihtml5-command='insertUnorderedList'>#{I18n.t("wysihtml5.unordered_list")}</a>"
          when :ordered_list
            "<a class='ol' data-wysihtml5-command='insertOrderedList'>#{I18n.t("wysihtml5.ordered_list")}</a>"
          when :source
            "<a class='html' data-wysihtml5-action='change_view'>#{I18n.t("wysihtml5.source")}</a>"
          end
        end

      end

    end
  end
end

