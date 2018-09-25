class Engineer < ApplicationRecord
  include AnyEnums
  # enum field: { server: 1, front: 2, infra: 3 }
  any_enums field: { server: 1, front: 2, infra: 3 }
end
