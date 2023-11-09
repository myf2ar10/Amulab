# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 30) }
    association :genre, factory: :genre
    association :user, factory: :user
  end
end