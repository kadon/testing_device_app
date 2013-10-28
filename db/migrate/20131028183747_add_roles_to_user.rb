class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :tester, :boolean
    add_column :users, :developer, :boolean
  end
end
