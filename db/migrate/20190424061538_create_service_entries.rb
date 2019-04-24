class CreateServiceEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :service_entries do |t|
      t.string :name
      t.integer :vehicle_id
      t.float :tax
      t.float :total
      t.datetime :service_date

      t.timestamps
    end
  end
end
