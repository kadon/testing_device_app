class AddUsbCableToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :take_cable, :boolean
  end
end
