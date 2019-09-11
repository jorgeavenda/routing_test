class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.decimal :capacity
      t.references :load, index: true
      t.references :driver, index: true

      t.timestamps
    end
  end
end
