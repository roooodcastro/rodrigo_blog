# frozen_string_literal: true

module Blog
  class Article < ApplicationRecord
    include Decoratable
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :author, class_name: 'User'

    validates :author, :title, :content, presence: true

    delegate :name, :email, to: :author, prefix: true

    scope :published, -> { where 'published_at is not null' }
    scope :unpublished, -> { where 'published_at is null' }
    scope :order_by_recents, -> { order created_at: :desc }
    scope :order_by_published, -> { order published_at: :desc }

    def published?
      published_at?
    end
  end
end
