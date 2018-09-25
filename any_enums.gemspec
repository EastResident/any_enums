$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "any_enums/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "any_enums"
  s.version     = AnyEnums::VERSION
  s.authors     = ["EastResident"]
  s.email       = ["eastresident@gmail.com"]
  s.homepage    = ""
  s.summary     = "You can select some enum value, by any_enums "
  s.description = "You can select some enum value, by any_enums"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
