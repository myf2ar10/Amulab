# spec/factories/genres.rb
FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.word }
  end
end