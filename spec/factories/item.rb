FactoryBot.define do
  factory :list do
    name { Faker::Lorem.characters(number:10) }
    description { Faker::Lorem.characters(number:30) }
  end

  config.include FactoryBot::Syntax::Methods
end