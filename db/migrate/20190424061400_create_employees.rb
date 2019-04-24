class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.string :department
      t.string :city

      t.timestamps
    end
  end
end
