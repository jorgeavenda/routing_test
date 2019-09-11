class CreateCitiesDriversJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_drivers do |t|
      t.references :city, index: true
      t.references :driver, index: true

      t.timestamps
    end
  end
end
