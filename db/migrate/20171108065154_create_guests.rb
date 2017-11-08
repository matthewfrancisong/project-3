class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.integer :table_num
      t.boolean :RSVP
      t.boolean :check_in
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
