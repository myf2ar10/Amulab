# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Admin.create!(
p id: 1,
  email: "admin@admin",
  password: "123456"
  )

User.create!(
p id: 0,
  email: "user@user.com",
  name: "ユーザー",
  phone_number: "0000000000",
  password: "123456"
  )

User.create!(
p id: 1,
  email: "user1@user1.com",
  name: "ユーザー1",
  phone_number: "01111111111",
  password: "123456"
  )

User.create!(
p id: 2,
  email: "user2@user2.com",
  name: "ユーザー2",
  phone_number: "0222222222",
  password: "123456"
  )

User.create!(
p id: 3,
  email: "user3@user3.com",
  name: "ユーザー3",
  phone_number: "0333333333",
  password: "123456"
  )

10.times do |n|
p   User.create!(
      email: Faker::Internet.email,
      name: Faker::Japanese::Name.name,
      phone_number: "012345678#{n + 1}",
      password: "123456",
    )
end

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

Genre.create!(
p id: 4,
  name: "テスト_ジャンル4"
  )

Genre.create!(
p id: 5,
  name: "テスト_ジャンル5"
  )

Genre.create!(
p id: 6,
  name: "テスト_ジャンル6"
  )

Genre.create!(
p id: 7,
  name: "テスト_ジャンル7"
  )

Genre.create!(
p id: 8,
  name: "テスト_ジャンル8"
  )

Genre.create!(
p id: 9,
  name: "テスト_ジャンル9"
  )

Genre.create!(
p id: 10,
  name: "テスト_ジャンル10"
  )

10.times do |n|
p   id = 10 + n + 1
  Genre.create!(
      id: id,
      name: Faker::Games::SuperMario.character + "ジャンル"
      # Faker::Music.genre
      # Faker::ProgrammingLanguage.name,
    )
end

Item.create!(
p id: 1,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル"),
  name: "テスト_作品",
  description: "テスト_作品説明文"
  )
p item = Item.find_by(name: "テスト_作品")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
p id: 2,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル2"),
  name: "テスト_作品2",
  description: "テスト_作品説明文2"
  )
p item = Item.find_by(name: "テスト_作品2")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2.png')), filename: 'test_item')
p item = Item.find_by(name: "テスト_作品2")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2_2.png')), filename: 'test_item')

Item.create!(
p id: 3,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル3"),
  name: "テスト_作品3",
  description: "テスト_作品説明文3"
  )
# item = Item.find_by(name: "テスト_作品3")
# item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
p id: 4,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル4"),
  name: "テスト_作品4",
  description: "テスト_作品説明文4"
  )
p item = Item.find_by(name: "テスト_作品4")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')
p item = Item.find_by(name: "テスト_作品4")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')
p item = Item.find_by(name: "テスト_作品4")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')

Item.create!(
p id: 5,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル5"),
  name: "テスト_作品5",
  description: "テスト_作品説明文5"
  )
p item = Item.find_by(name: "テスト_作品5")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test5.png')), filename: 'test_item')

Item.create!(
p id: 6,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル6"),
  name: "テスト_作品6",
  description: "テスト_作品説明文6"
  )
p item = Item.find_by(name: "テスト_作品6")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test6.png')), filename: 'test_item')

Item.create!(
p id: 7,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル7"),
  name: "テスト_作品7",
  description: "テスト_作品説明文7"
  )
p item = Item.find_by(name: "テスト_作品7")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test7.png')), filename: 'test_item')

Item.create!(
p id: 8,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル8"),
  name: "テスト_作品8",
  description: "テスト_作品説明文8"
  )
p item = Item.find_by(name: "テスト_作品8")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test8.png')), filename: 'test_item')
p item = Item.find_by(name: "テスト_作品8")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test8_2.png')), filename: 'test_item')

Item.create!(
p id: 9,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル9"),
  name: "テスト_作品9",
  description: "テスト_作品説明文9"
  )
p item = Item.find_by(name: "テスト_作品9")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test9.png')), filename: 'test_item')

Item.create!(
p id: 10,
  user: User.find_by(name: "ユーザー"),
  genre: Genre.find_by(name: "テスト_ジャンル10"),
  name: "テスト_作品10",
  description: "テスト_作品説明文10"
  )
p item = Item.find_by(name: "テスト_作品10")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test10.png')), filename: 'test_item')
p item = Item.find_by(name: "テスト_作品10")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test10_2.png')), filename: 'test_item')

5.times do |n|
p     id = 10 + n + 1
  Item.create!(
      id: id,
      user: User.find_by(name: "ユーザー2"),
      genre: Genre.find_by(id: 10 + n + 1),
      name: Faker::Games::Pokemon.name + "って作品",
      description: Faker::Games::Pokemon.location + "みたいな作品です。ああああああああああああああああああああああああああああああ。",
    )
end

5.times do |n|
p item = Item.find_by(id: 10 + n + 1)
item.images.attach(io: File.open(Rails.root.join('app/assets/images/test_11-15.png')), filename: 'test_item')
end

5.times do |n|
p     id = 15 + n + 1
  Item.create!(
      id: id,
      user: User.find_by(name: "ユーザー3"),
      genre: Genre.find_by(id: 15 + n + 1),
      name: Faker::Games::Pokemon.name + "って作品",
      description: Faker::Games::Pokemon.location + "みたいな作品です。いいいいいいいいいいいいいいいいいいいいいいいいいいいいいい。",
    )
end

5.times do |n|
p item = Item.find_by(id: 15 + n + 1)
item.images.attach(io: File.open(Rails.root.join('app/assets/images/test_16-20.png')), filename: 'test_item')
end