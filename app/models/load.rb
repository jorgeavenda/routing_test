class Load < ApplicationRecord
  has_one :route
  has_one :vehicle

  enum load_type: { general: 0, refrigerated: 1 }
end
