class City < ApplicationRecord
  has_and_belongs_to_many :drivers
  has_and_belongs_to_many :routes
end
