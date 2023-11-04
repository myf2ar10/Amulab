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

User.create!(
  p email: "user@user",
  name: "ユーザー",
  phone_number: "00000000000",
  password: "123456"
  )

Genre.create!(
  p name: "テスト_ジャンル"
  # , genre_id: 1
  )

Item.create!(
  p genre: Genre.find_by(name: "テスト_ジャンル"),
  # genre_id:1,
  name: "テスト_作品",
  # item_id: 1,
  description: "テスト_作品説明文",
  user_id: "1",
  image_id: "1"
  )
item = Item.find_by(name: "テスト_作品")
item.image.attach(io: File.open(Rails.root.join('app/assets/images/no_image_PIK.jpg')), filename: 'test_item')