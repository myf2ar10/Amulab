# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  p id: 1,
  email: "admin@admin",
  password: "123456"
  )

User.create!(
  p id: 1,
  email: "user@user",
  name: "ユーザー",
  phone_number: "00000000000",
  password: "123456"
  )

User.create!(
  p id: 2,
  email: "user2@user",
  name: "ユーザー2",
  phone_number: "2222222222",
  password: "123456"
  )

User.create!(
  p id: 3,
  email: "user3@user",
  name: "ユーザー3",
  phone_number: "33333333333",
  password: "123456"
  )

Genre.create!(
  p id: 1,
  name: "テスト_ジャンル"
  )

Genre.create!(
  p id: 2,
  name: "テスト_ジャンル2"
  )

Genre.create!(
  p id: 3,
  name: "テスト_ジャンル3"
  )

Item.create!(
  p id: 1,
  genre: Genre.find_by(name: "テスト_ジャンル"),
  # genre_id:1,
  name: "テスト_作品",
  # item_id: 1,
  description: "テスト_作品説明文"
  # user_id: "1",
  # image_id: "1"
  )
item = Item.find_by(name: "テスト_作品")
item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 2,
  genre: Genre.find_by(name: "テスト_ジャンル2"),
  name: "テスト_作品2",
  description: "テスト_作品説明文2"
  )
item = Item.find_by(name: "テスト_作品2")
item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 3,
  genre: Genre.find_by(name: "テスト_ジャンル3"),
  name: "テスト_作品3",
  description: "テスト_作品説明文3"
  )
# item = Item.find_by(name: "テスト_作品3")
# item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')