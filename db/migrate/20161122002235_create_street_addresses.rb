class CreateStreetAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :street_addresses do |t|
      t.string :address
      t.string :type
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
