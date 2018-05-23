FactoryBot.define do
  factory :blog_article_tag, class: Blog::ArticleTag do
    association :article, factory: :blog_article
    association :tag, factory: :blog_tag
  end
end
