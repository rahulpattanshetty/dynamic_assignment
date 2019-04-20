class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :is_admin, :boolean, default: false
    add_column :users, :role_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
