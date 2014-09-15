class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :uid
      t.float :longtitude
      t.float :latitude

      t.timestamps
    end
  end
end
