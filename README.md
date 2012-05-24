# Railsyard::Wysihtml5

WYISHTML5 editor for Railsyard

## Installation

1. Gemfile:

        gem "railsyard-wysihtml5"

2. Backend configuration (e.g. app/backend/editor_for_books.rb):

        field( :description, as: :wysihtml5) do
          input_options toolbar:
            {commands: [:bold, :italic, :link, :image, :unordered_list, :ordered_list, :source]} # any of these
          end
        end
