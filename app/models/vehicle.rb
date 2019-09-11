class Vehicle < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :load
  has_many :routes
end
