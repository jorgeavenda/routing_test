class Vehicle < ApplicationRecord
  belongs_to :driver
  belongs_to :load
  has_many :routes
end
