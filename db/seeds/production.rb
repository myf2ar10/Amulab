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
p id: 0,
  email: "user@user.com",
  name: "編み物大好きっ子",
  phone_number: "0000000000",
  password: "123456"
  )

User.create!(
p id: 2,
  email: "user2@user2.com",
  name: "はなちゃん",
  phone_number: "0222222222",
  password: "123456"
  )

User.create!(
p id: 3,
  email: "user3@user3.com",
  name: "真子",
  phone_number: "0333333333",
  password: "123456"
  )

User.create!(
p id: 4,
  email: "user4@user4.com",
  name: "名無しの権兵衛",
  phone_number: "04444444444",
  password: "123456"
  )

Genre.create!(
p id: 1,
  name: "いいねが欲しい"
  )

Genre.create!(
p id: 2,
  name: "コメントが欲しい"
  )

Genre.create!(
p id: 3,
  name: "自分用のメモ"
  )

Genre.create!(
p id: 4,
  name: "その他"
  )

Genre.create!(
p id: 5,
  name: "かばん"
  )

Genre.create!(
p id: 6,
  name: "ポーチ"
  )

Genre.create!(
p id: 7,
  name: "編み物"
  )

Genre.create!(
p id: 8,
  name: "縫い物"
  )

Genre.create!(
p id: 9,
  name: "適当に作ってみた"
  )

Genre.create!(
p id: 10,
  name: "お気に入り"
  )

Item.create!(
p id: 1,
  user: User.find_by(name: "編み物大好きっ子"),
  genre: Genre.find_by(name: "適当に作ってみた"),
  name: "リトルグリーンメンのミニバッグ",
  description: "ビニールひもで編みました。試しに作ったので網目がずれています。楽しく作れました！"
  )
p item = Item.find_by(name: "リトルグリーンメンのミニバッグ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
p id: 2,
  user: User.find_by(name: "編み物大好きっ子"),
  genre: Genre.find_by(name: "かばん"),
  name: "ミニバッグ",
  description: "100均で買った毛糸で編みました。どこの100均か忘れました💦バイカラーにしてこだわっています。これを作ったときは初めて底板を使いました。持ち手も既製品を使ったので丈夫で、今も使っているバッグです。"
  )
p item = Item.find_by(name: "ミニバッグ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2.png')), filename: 'test_item')
p item = Item.find_by(name: "ミニバッグ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test2_2.png')), filename: 'test_item')

Item.create!(
p id: 3,
  user: User.find_by(name: "編み物大好きっ子"),
  genre: Genre.find_by(name: "自分用のメモ"),
  name: "メモ",
  description: "次回作ったらここを編集。画像未貼付"
  )
# item = Item.find_by(name: "メモ")
# item.images.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')), filename: 'test_item')

Item.create!(
p id: 4,
  user: User.find_by(name: "はなちゃん"),
  genre: Genre.find_by(name: "編み物"),
  name: "ミニオン",
  description: "余っていたビニールひもを使って編み図なしで編んだ。ミニオン。手が痛かった。"
  )
p item = Item.find_by(name: "ミニオン")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')
p item = Item.find_by(name: "ミニオン")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')
p item = Item.find_by(name: "ミニオン")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test4.png')), filename: 'test_item')

Item.create!(
p id: 5,
  user: User.find_by(name: "はなちゃん"),
  genre: Genre.find_by(name: "編み物"),
  name: "バッグ",
  description: "ベロア風のバッグを編んだ。チャームを余りもの。糸処理が雑になったので次回気を付ける。"
  )
p item = Item.find_by(name: "バッグ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test5.png')), filename: 'test_item')

Item.create!(
p id: 6,
  user: User.find_by(name: "はなちゃん"),
  genre: Genre.find_by(name: "その他"),
  name: "座布団",
  description: "ネットの編み図を見ながら座布団を編んだ。極太の意図を使った。いろんな色のモチーフをたくさん作るのが楽しかった。"
  )
p item = Item.find_by(name: "座布団")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test6.png')), filename: 'test_item')

Item.create!(
p id: 7,
  user: User.find_by(name: "真子"),
  genre: Genre.find_by(name: "その他"),
  name: "貯金箱",
  description: "昔作った工作の貯金箱です。出来が良かったので記録として登録しておきます。確か表彰されました。嬉しかったです。"
  )
p item = Item.find_by(name: "貯金箱")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test7.png')), filename: 'test_item')

Item.create!(
p id: 8,
  user: User.find_by(name: "真子"),
  genre: Genre.find_by(name: "お気に入り"),
  name: "ピンクのかばん",
  description: "衣類を一時的に仕舞う用に入れ物が欲しかったので適当に編んでみました。結構気に入っています。"
  )
p item = Item.find_by(name: "ピンクのかばん")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test8.png')), filename: 'test_item')
p item = Item.find_by(name: "ピンクのかばん")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test8_2.png')), filename: 'test_item')

Item.create!(
p id: 9,
  user: User.find_by(name: "真子"),
  genre: Genre.find_by(name: "縫い物"),
  name: "携帯ケース",
  description: "ポケットのない服を着ているときに携帯を入れておくところがないのでケースを縫いました。便利です★"
  )
p item = Item.find_by(name: "携帯ケース")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test9.png')), filename: 'test_item')

Item.create!(
p id: 10,
  user: User.find_by(name: "真子"),
  genre: Genre.find_by(name: "ポーチ"),
  name: "ポーチ",
  description: "何か小物を入れる用のポーチです。"
  )
p item = Item.find_by(name: "ポーチ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test10.png')), filename: 'test_item')
p item = Item.find_by(name: "ポーチ")
 item.images.attach(io: File.open(Rails.root.join('app/assets/images/test10_2.png')), filename: 'test_item')


Item.create!(
p id: 11,
  user: User.find_by(name: "名無しの権兵衛"),
  genre: Genre.find_by(name: "コメントが欲しい"),
  name: "コメントで絡みたい",
  description: "特にハンドメイドはしない"
  )