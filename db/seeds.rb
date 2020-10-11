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

Testimonial.create(
  name: "Katie",
  image_path: "katie1.jpg",
  message: "Such an amazing teacher! Super patient and kind, and fun to be around! She’s really good at making things easier to understand. I definitely recommend her!!",
  date: Date.new(2019, 1, 11)
)

Testimonial.create(
  name: "Quinn",
  image_path: "quinn1.jpg",
  message: "Yukiko is a very nice teacher, full of kind and patience 😁I really want to study with her for a long period~",
  date: Date.new(2019, 5, 6)
)

Stripe::Product.list.each do |p|
  StripeServices::ImportProduct.new(p.to_h).call
end