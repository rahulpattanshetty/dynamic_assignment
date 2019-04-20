class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.integer :model_list_id
      t.boolean :is_create
      t.boolean :is_read
      t.boolean :is_update
      t.boolean :is_destroy
      t.integer :role_id

      t.timestamps
    end
  end
end
