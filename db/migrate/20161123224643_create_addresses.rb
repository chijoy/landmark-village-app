class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :type
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
