class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.integer :table_number
      t.boolean :RSVP
      t.boolean :check_in

      t.timestamps
    end
  end
end
