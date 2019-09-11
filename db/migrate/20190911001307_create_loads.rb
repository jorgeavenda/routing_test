class CreateLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :loads do |t|
      t.string :name
      t.integer :load_type

      t.timestamps
    end
  end
end
