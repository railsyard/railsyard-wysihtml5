require 'railsyard/wysihtml5/simple_form/wysihtml5_input'

module Railsyard
  module Wysihtml5
    module Inputs
    end
  end
end

SimpleForm::Inputs.send(:include, Railsyard::Wysihtml5::Inputs)
