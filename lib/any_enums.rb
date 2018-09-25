require "any_enums/railtie"
require "any_enums/assign"
require "any_enums/key_searcher"

module AnyEnums
  extend ActiveSupport::Concern
  included do
    include AnyEnums::Assign
    include AnyEnums::KeySearcher
  end
end
