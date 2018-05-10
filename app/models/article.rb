# frozen_string_literal: true

class Article < ApplicationRecord
  include Decoratable
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessor :tags_text

  belongs_to :author, class_name: 'User'
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :comments, as: :commentable, dependent: :destroy

  after_save :create_tags

  validates :author, :title, :content, presence: true

  delegate :name, :email, to: :author, prefix: true

  scope :published, -> { where 'published_at is not null' }
  scope :unpublished, -> { where 'published_at is null' }
  scope :order_by_recents, -> { order created_at: :desc }
  scope :order_by_published, -> { order published_at: :desc }
  scope :with_tags, -> { includes :tags }

  scope :related_to, ->(article) do
    joins(:article_tags).where.not(id: article.id).published
      .where(article_tags: { tag_id: article.tags.map(&:id) })
      .group('articles.id').order("count('articles.id') desc")
      .having("count('articles.id') > 0").limit(5)
  end

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
      tag = Tag.find_or_create_by(name: text)
      ArticleTag.find_or_create_by(article: self, tag: tag)
    end
    (article_tags - new_article_tags).map(&:destroy)
  end
end
