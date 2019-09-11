class Driver < ApplicationRecord
  has_one :vehicle
  has_many :routes
  has_and_belongs_to_many :preferences_cities, class_name: 'City'
end
