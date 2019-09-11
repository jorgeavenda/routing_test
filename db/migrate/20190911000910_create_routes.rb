class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.decimal :load_sum
      t.integer :stops_amount
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :load, index: true
      t.references :vehicle, index: true
      t.references :driver, index: true

      t.timestamps
    end
  end
end
