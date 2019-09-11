class CreateCitiesRoutesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_routes do |t|
      t.references :city, index: true
      t.references :route, index: true

      t.timestamps
    end
  end
end
