FactoryBot.define do
  factory :blog_comment, class: Blog::Comment do
    body { Faker::Lorem.paragraph }

    association :user
    association :commentable, factory: :blog_article

    trait(:reply) { association :commentable, factory: :blog_comment }
  end
end