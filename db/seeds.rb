require 'faker'

# Create cities
10.times do
  City.create(name: Faker::Nation.capital_city)
end

# Create loads
['general', 'refrigerated'].each do |t|
  Load.create(name: t, load_type: Load.load_types[t])
end

# Create Drivers without vehicle
10.times do
  Driver.create(name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone,
                email: Faker::Internet.email)
end

# Create Vehicles without driver
10.times do
  Vehicle.create(capacity: Faker::Number.decimal(l_digits: 2), load_id: Faker::Number.between(from: 1, to: 2))
end

# Create Drivers with vehicle
10.times do
  driver = Driver.create(name: Faker::Name.name, phone: Faker::Number.number(digits: 9),
                         email: Faker::Internet.email)
  Vehicle.create(capacity: Faker::Number.decimal(l_digits: 2), load_id: Faker::Number.between(from: 1, to: 2),
                 driver: driver)
end

# Set preferences_cities to drivers
Driver.all.each do |driver|
  driver.preferences_cities << City.find(
    [*Faker::Number.between(from: 1, to: 10)..Faker::Number.between(from: 1, to: 10)])
end

# Create routes to be assigned driver and vehicle
30.times do
  range = Faker::Number.between(from: 1, to: 5) * 3600
  starts_at = Faker::Time.between(from: Time.now.beginning_of_day, to: Time.now.end_of_day - range)
  ends_at = starts_at + range
  route = Route.create(starts_at: starts_at, ends_at: ends_at, load_id: Faker::Number.between(from: 1, to: 2),
                       load_sum: Faker::Number.decimal(l_digits: 2),
                       stops_amount: Faker::Number.between(from: 1, to: 10))
  route.cities << City.find([*Faker::Number.between(from: 1, to: 10)..Faker::Number.between(from: 1, to: 10)])
end
