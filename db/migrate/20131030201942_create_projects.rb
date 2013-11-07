class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :customer
      t.string :key

      t.timestamps
    end
  end
end
