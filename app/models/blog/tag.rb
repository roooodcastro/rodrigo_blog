module Blog
  class Tag < ApplicationRecord
    include Decoratable
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :article_tags, dependent: :destroy
    has_many :articles, through: :article_tags

    validates :name, presence: true, uniqueness: true

    scope :ordered_by_name, -> { order :name }
    scope :with_article_tags, -> { includes :article_tags }

    def article_count
      "(x#{article_tags.count})"
    end
  end
end
