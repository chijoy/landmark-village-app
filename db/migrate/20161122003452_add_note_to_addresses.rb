class AddNoteToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :street_addresses, :note, :string
  end
end
