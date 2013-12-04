class AddFieldsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :start_using, :datetime
    add_column :devices, :user_id, :integer
    add_column :devices, :project_id, :integer

    add_index :devices, :user_id
    add_index :devices, :project_id
  end
end
