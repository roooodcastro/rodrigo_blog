module Blog
  class Tag < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :article_tags
    has_many :articles, through: :article_tags

    validates :name, presence: true, uniqueness: true

    def article_count
      "(x#{article_tags.count})"
    end
  end
end
