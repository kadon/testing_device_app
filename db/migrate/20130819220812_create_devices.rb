class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type_device
      t.string :so
      t.string :version
      t.string :no_serie
      t.string :id_inventario
      t.string :udid
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
