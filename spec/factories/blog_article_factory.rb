FactoryBot.define do
  factory :blog_article, class: Blog::Article do
    title { Faker::Lorem.words(5) }
    content { Faker::Lorem.paragraph }
    association :author, factory: :user

    trait(:published) { published_at { 1.hour.ago } }
  end
end
