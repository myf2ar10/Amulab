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

30.times do |n|
   p n
    p User.create!(
      email: Faker::Internet.email,
      name: Faker::Japanese::Name.name + "さん",
      phone_number: "0123456789#{n + 1}",
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

30.times do |n|
   id = 10 + n + 1
    p id
    p Genre.create!(
      id: id,
      name: Faker::Games::SuperMario.character + "ジャンル"
      # Faker::Music.genre
      # Faker::ProgrammingLanguage.name,
    )
end

Item.create!(
  p id: 1,
  genre: Genre.find_by(name: "テスト_ジャンル"),
  name: "テスト_作品",
  description: "テスト_作品説明文"
  )
item = Item.find_by(name: "テスト_作品")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 2,
  genre: Genre.find_by(name: "テスト_ジャンル2"),
  name: "テスト_作品2",
  description: "テスト_作品説明文2"
  )
item = Item.find_by(name: "テスト_作品2")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test1.png')), filename: 'test_item')
item = Item.find_by(name: "テスト_作品2")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2.png')), filename: 'test_item')

Item.create!(
  p id: 3,
  genre: Genre.find_by(name: "テスト_ジャンル3"),
  name: "テスト_作品3",
  description: "テスト_作品説明文3"
  )
# item = Item.find_by(name: "テスト_作品3")
# item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 4,
  genre: Genre.find_by(name: "テスト_ジャンル4"),
  name: "テスト_作品4",
  description: "テスト_作品説明文4"
  )
item = Item.find_by(name: "テスト_作品4")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')
item = Item.find_by(name: "テスト_作品4")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test1.png')), filename: 'test_item')
item = Item.find_by(name: "テスト_作品4")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2.png')), filename: 'test_item')

Item.create!(
  p id: 5,
  genre: Genre.find_by(name: "テスト_ジャンル5"),
  name: "テスト_作品5",
  description: "テスト_作品説明文5"
  )
item = Item.find_by(name: "テスト_作品5")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2.png')), filename: 'test_item')

Item.create!(
  p id: 6,
  genre: Genre.find_by(name: "テスト_ジャンル6"),
  name: "テスト_作品6",
  description: "テスト_作品説明文6"
  )
item = Item.find_by(name: "テスト_作品6")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')

Item.create!(
  p id: 7,
  genre: Genre.find_by(name: "テスト_ジャンル7"),
  name: "テスト_作品7",
  description: "テスト_作品説明文7"
  )
item = Item.find_by(name: "テスト_作品7")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 8,
  genre: Genre.find_by(name: "テスト_ジャンル8"),
  name: "テスト_作品8",
  description: "テスト_作品説明文8"
  )
item = Item.find_by(name: "テスト_作品8")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')

Item.create!(
  p id: 9,
  genre: Genre.find_by(name: "テスト_ジャンル9"),
  name: "テスト_作品9",
  description: "テスト_作品説明文9"
  )
item = Item.find_by(name: "テスト_作品9")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
  p id: 10,
  genre: Genre.find_by(name: "テスト_ジャンル10"),
  name: "テスト_作品10",
  description: "テスト_作品説明文10"
  )
item = Item.find_by(name: "テスト_作品10")
p item.images.attach(io: File.open(Rails.root.join('app/assets/images/test3.png')), filename: 'test_item')

30.times do |n|
    id = 10 + n + 1
    p id
    p Item.create!(
      id: id,
      genre: Genre.find_by(id: 10 + n + 1),
      name: Faker::Games::Pokemon.name + "作品",
      description: Faker::Games::Pokemon.location + "みたいな作品です。",
    )
end

30.times do |n|
  p n
item = Item.find_by(id: 10 + n + 1)
item.images.attach(io: File.open(Rails.root.join('app/assets/images/test3.png')), filename: 'test_item')
end