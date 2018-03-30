module Blog
  class Article < ApplicationRecord
    include Decoratable
    # extend FriendlyId
    # friendly_id :title, use: :slugged

    belongs_to :author, class_name: 'User'

    validates :author, :title, :content, presence: true

    scope :published, -> { where 'published_at is not null' }
    scope :unpublished, -> { where 'published_at is null' }
  end
end
