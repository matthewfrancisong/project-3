class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :title
      t.date :date
      t.time :time
      t.string :location
      t.integer :num_table
      t.integer :num_seat

      t.timestamps
    end
  end
end
