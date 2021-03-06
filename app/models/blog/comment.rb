# frozen_string_literal: true

module Blog
  class Comment < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :commentable, polymorphic: true
    belongs_to :article, foreign_key: 'commentable_id',
               foreign_type: 'Blog::Article', required: false
    belongs_to :parent, foreign_key: 'commentable_id',
               foreign_type: 'Blog::Comment', required: false,
               class_name: 'Blog::Comment'

    has_many :replies, as: :commentable, class_name: 'Blog::Comment',
             dependent: :destroy

    before_validation :pull_user_info_from_user

    validates :user_name, presence: true
    validates :body, length: { maximum: 500 }

    scope :order_by_recents, -> { order created_at: :desc }
    scope :with_second_level_replies, -> { includes replies: :replies }

    def parent_article
      article || parent.parent_article
    end

    private

    def pull_user_info_from_user
      return unless user
      self.user_name = user.name
      self.user_email = user.email
    end
  end
end
