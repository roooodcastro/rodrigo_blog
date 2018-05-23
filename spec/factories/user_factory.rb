FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Simpsons.character }
    password { SecureRandom.hex(8) }

    trait(:admin) { admin true }
    trait(:poster) { poster true }
  end
end
