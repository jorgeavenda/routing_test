class Route < ApplicationRecord
  belongs_to :load
  belongs_to :vehicle, optional: true
  belongs_to :driver, optional: true
  has_and_belongs_to_many :cities

  default_scope { order(id: :asc) }
end
