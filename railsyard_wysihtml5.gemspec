$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsyard/wysihtml5/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsyard-wysihtml5"
  s.version     = Railsyard::Wysihtml5::VERSION
  s.authors     = ["Stefano Verna"]
  s.email       = ["stefano.verna@gmail.com"]
  s.homepage    = "http://github.com/cantierecreativo/railsyard-wysihtml5"
  s.summary     = "Adds a new :wysihtml5 field type to your Railsyard installation"
  s.description = "Adds a new :wysihtml5 field type to your Railsyard installation"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railsyard"
  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "simple_form", "~> 2.0.1"
end
