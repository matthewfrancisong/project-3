# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 2.times do
#   new_admin = Admin.new
#   new_admin.name = Faker::Hobbit.character
#   new_admin.email = Faker::Internet.email
#   new_admin.password = 'test123'
#
#   new_admin.save
# end

5.times do
  new_guest = Guest.new
  new_guest.name = Faker::StarTrek.character
  new_guest.email = Faker::Internet.email
  new_guest.admin_id = 1
  new_guest.save
end
# e
# end
