# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_role = Role.find_or_create_by(slug: "admin")
Role.find_or_create_by(slug: "student")
user = User.find_or_create_by(email: "changeme@fake.com") do |user|
  user.password = "test123"
end
user.roles = [admin_role]
