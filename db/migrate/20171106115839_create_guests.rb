class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.boolean :RSVP
      t.integer :table
      t.boolean :check_in
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
