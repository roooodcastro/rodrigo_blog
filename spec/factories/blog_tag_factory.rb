FactoryBot.define do
  factory :blog_tag, class: Blog::Tag do
    name { Faker::SiliconValley.app }
  end
end