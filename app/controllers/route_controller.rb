class RouteController < ApplicationController
  def index
    @routes = Route.all
  end

  def assign
    @routes = Route.find_each.map do |route|
      assign_vehicle(route)
      if route.vehicle.present? && route.vehicle.driver.present?
        route.driver = route.vehicle.driver if driver_validations(route.vehicle.driver, route)
      end
      assign_diver(route) if route.vehicle.present? && route.driver.blank?
      route.save if route.vehicle.present? && route.driver.present?
      route
    end
    render :index
  end

  def unassign
    @routes = Route.find_each.map do |route|
      route.update_attributes(vehicle: nil, driver: nil)
      route
    end
    render :index
  end

  private

  def assign_diver(route)
    Driver.find_each do |driver|
      route.driver = driver if driver_validations(driver, route)
      if route.driver.present?
        break
      end
    end
  end

  def assign_vehicle(route)
    route.vehicle = Vehicle.joins(:load).find_by('capacity > ? AND loads.load_type = ?',
                                                 route.load_sum,
                                                 Load.load_types[route.load.load_type])
  end

  def driver_validations(driver, route)
    (driver.preferences_cities.empty? || (route.cities.pluck(:id) - driver.preferences_cities.pluck(:id)).empty?) &&
    Route.where("driver_id = :driver AND ((starts_at <= :starts_at AND ends_at >= :starts_at) OR (starts_at <= :ends_at AND ends_at >= :ends_at))", { driver: driver.id, starts_at: route.starts_at, ends_at: route.ends_at }).empty?
  end
end
