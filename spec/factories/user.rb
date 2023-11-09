# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    password { 'password123' }  # 仮のパスワード、実際のプロジェクトでは適切な方法でパスワードを扱う必要あり
  end
end