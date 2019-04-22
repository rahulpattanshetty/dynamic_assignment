class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :registration
      t.string :model
      t.string :color

      t.timestamps
    end
  end
end
