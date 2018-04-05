# frozen_string_literal: true

module Blog
  class Article < ApplicationRecord
    include Decoratable
    extend FriendlyId
    friendly_id :title, use: :slugged

    attr_accessor :tags_text

    belongs_to :author, class_name: 'User'
    has_many :article_tags
    has_many :tags, through: :article_tags

    after_save :create_tags

    validates :author, :title, :content, presence: true

    delegate :name, :email, to: :author, prefix: true

    scope :published, -> { where 'published_at is not null' }
    scope :unpublished, -> { where 'published_at is null' }
    scope :order_by_recents, -> { order created_at: :desc }
    scope :order_by_published, -> { order published_at: :desc }

    def formatted_tags
      tags.map(&:name).join(', ')
    end

    def published?
      published_at?
    end

    private

    def create_tags
      return unless tags_text
      new_article_tags = tags_text.split(',').map(&:strip).uniq.map do |text|
        tag = Blog::Tag.find_or_create_by(name: text)
        Blog::ArticleTag.find_or_create_by(article: self, tag: tag)
      end
      (article_tags - new_article_tags).map(&:destroy)
    end
  end
end
