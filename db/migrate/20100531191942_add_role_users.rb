class AddRoleUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userrole, :string
  end
  def self.down
    remove_column :users, :userrole
  end
end
