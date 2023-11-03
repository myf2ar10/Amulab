# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  p email: "admin@admin",
  password: "123456"
)

# User.create!(
#   p name: "ユーザー",
#   email: "user@user",
#   phone_number: "00000000000",
#   password: "123456"
#   )

# Item.create!(
#   p genre_id: "1",
#   name: "test",
#   description: "test"
# )
# item = Item.find_by(name: "test")
# item.image.attach(io: File.open(Rails.root.join('/amulab/app/assets/images/no_image_PIK.jpg')), filename: 'test')