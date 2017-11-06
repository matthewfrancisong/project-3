class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :title
      t.date :date
      t.string :location
      t.time :time
      t.string :programme

      t.timestamps
    end
  end
end
